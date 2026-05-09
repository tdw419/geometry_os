; DESCRIPTION: Renders a green box of size 84x116 starting at (4, 110).
; PLAN: r0=4(x), r1=110(y), r2=84(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 110
LDI r2, 84
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
