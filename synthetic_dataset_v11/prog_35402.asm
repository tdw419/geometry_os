; DESCRIPTION: Renders a black box of size 79x40 starting at (84, 212).
; PLAN: r0=84(x), r1=212(y), r2=79(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 212
LDI r2, 79
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
