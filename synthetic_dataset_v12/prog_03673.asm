; DESCRIPTION: Renders a magenta box of size 119x94 starting at (310, 40).
; PLAN: r0=310(x), r1=40(y), r2=119(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 40
LDI r2, 119
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
