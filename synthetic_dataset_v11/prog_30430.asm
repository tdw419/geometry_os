; DESCRIPTION: Composite: . Then Draws a purple line from (248, 45) to (253, 58). Then Renders a cyan disk with center (99, 229) and radius 24.
; PLAN: r0=248(x1), r1=45(y1), r2=253(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=229(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (248, 45) to (253, 58).
; PLAN: r0=248(x1), r1=45(y1), r2=253(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 45
LDI r2, 253
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (99, 229) and radius 24.
; PLAN: r0=99(x), r1=229(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 229
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
