; DESCRIPTION: Renders a white box of size 65x87 starting at (278, 25).
; PLAN: r0=278(x), r1=25(y), r2=65(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 25
LDI r2, 65
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
