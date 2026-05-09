; DESCRIPTION: Renders a black box of size 54x87 starting at (206, 124).
; PLAN: r0=206(x), r1=124(y), r2=54(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 124
LDI r2, 54
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
