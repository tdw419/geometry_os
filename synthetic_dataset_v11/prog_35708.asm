; DESCRIPTION: Composite: . Then Creates a purple circular shape at (140, 193) with radius 17. Then Places a yellow line segment connecting (60, 93) to (233, 146).
; PLAN: r0=140(x), r1=193(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x1), r1=93(y1), r2=233(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (140, 193) with radius 17.
; PLAN: r0=140(x), r1=193(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 193
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (60, 93) to (233, 146).
; PLAN: r0=60(x1), r1=93(y1), r2=233(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 93
LDI r2, 233
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
