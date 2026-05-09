; DESCRIPTION: Renders a white box of size 47x87 starting at (27, 77).
; PLAN: r0=27(x), r1=77(y), r2=47(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 47
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
