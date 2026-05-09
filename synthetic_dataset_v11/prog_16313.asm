; DESCRIPTION: Composite: . Then Places a purple line segment connecting (75, 162) to (181, 240). Then Places a white circle of radius 42 at center (213, 52).
; PLAN: r0=75(x1), r1=162(y1), r2=181(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=213(x), r1=52(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (75, 162) to (181, 240).
; PLAN: r0=75(x1), r1=162(y1), r2=181(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 162
LDI r2, 181
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 42 at center (213, 52).
; PLAN: r0=213(x), r1=52(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 52
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
