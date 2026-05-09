; DESCRIPTION: Renders a blue box of size 111x83 starting at (99, 159).
; PLAN: r0=99(x), r1=159(y), r2=111(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 159
LDI r2, 111
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
