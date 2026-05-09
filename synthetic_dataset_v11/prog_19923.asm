; DESCRIPTION: Composite: . Then Places a white line segment connecting (105, 32) to (199, 106). Then Creates a purple circular shape at (146, 94) with radius 59.
; PLAN: r0=105(x1), r1=32(y1), r2=199(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=94(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (105, 32) to (199, 106).
; PLAN: r0=105(x1), r1=32(y1), r2=199(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 32
LDI r2, 199
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (146, 94) with radius 59.
; PLAN: r0=146(x), r1=94(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 94
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
