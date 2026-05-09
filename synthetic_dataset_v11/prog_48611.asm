; DESCRIPTION: Composite: . Then Places a white line segment connecting (195, 98) to (197, 199). Then Draws a black circle centered at (144, 203) with radius 25.
; PLAN: r0=195(x1), r1=98(y1), r2=197(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=203(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (195, 98) to (197, 199).
; PLAN: r0=195(x1), r1=98(y1), r2=197(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 98
LDI r2, 197
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (144, 203) with radius 25.
; PLAN: r0=144(x), r1=203(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 203
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
