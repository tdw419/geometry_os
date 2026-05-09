; DESCRIPTION: Renders a green box of size 105x40 starting at (332, 135).
; PLAN: r0=332(x), r1=135(y), r2=105(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 135
LDI r2, 105
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
