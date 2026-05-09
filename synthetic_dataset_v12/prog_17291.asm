; DESCRIPTION: Renders a purple box of size 119x21 starting at (286, 159).
; PLAN: r0=286(x), r1=159(y), r2=119(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 159
LDI r2, 119
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
