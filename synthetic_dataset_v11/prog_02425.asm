; DESCRIPTION: Composite: . Then Places a blue dot at position (155, 225). Then Creates a green rectangular region at (34, 81) spanning 113 by 101 pixels.
; PLAN: r0=155(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=34(x), r1=81(y), r2=113(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (155, 225).
; PLAN: r0=155(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (34, 81) spanning 113 by 101 pixels.
; PLAN: r0=34(x), r1=81(y), r2=113(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 81
LDI r2, 113
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
