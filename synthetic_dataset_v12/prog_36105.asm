; DESCRIPTION: Renders a green box of size 33x96 starting at (324, 122).
; PLAN: r0=324(x), r1=122(y), r2=33(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 122
LDI r2, 33
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
