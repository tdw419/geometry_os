; DESCRIPTION: Renders a green box of size 48x44 starting at (319, 110).
; PLAN: r0=319(x), r1=110(y), r2=48(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 110
LDI r2, 48
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
