; DESCRIPTION: Composite: . Then Creates a purple circular shape at (146, 96) with radius 43. Then Renders a green line between points (169, 145) and (193, 4).
; PLAN: r0=146(x), r1=96(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=169(x1), r1=145(y1), r2=193(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (146, 96) with radius 43.
; PLAN: r0=146(x), r1=96(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 96
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (169, 145) and (193, 4).
; PLAN: r0=169(x1), r1=145(y1), r2=193(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 145
LDI r2, 193
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
