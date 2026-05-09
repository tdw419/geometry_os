; DESCRIPTION: Renders a green box of size 43x83 starting at (261, 1).
; PLAN: r0=261(x), r1=1(y), r2=43(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 1
LDI r2, 43
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
