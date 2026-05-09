; DESCRIPTION: Composite: . Then Draws a black circle centered at (105, 60) with radius 24. Then Draws a green line from (240, 191) to (163, 68).
; PLAN: r0=105(x), r1=60(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x1), r1=191(y1), r2=163(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (105, 60) with radius 24.
; PLAN: r0=105(x), r1=60(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 60
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (240, 191) to (163, 68).
; PLAN: r0=240(x1), r1=191(y1), r2=163(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 191
LDI r2, 163
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
