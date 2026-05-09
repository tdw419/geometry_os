; DESCRIPTION: Renders a black box of size 57x87 starting at (49, 142).
; PLAN: r0=49(x), r1=142(y), r2=57(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 142
LDI r2, 57
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
