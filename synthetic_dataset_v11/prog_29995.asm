; DESCRIPTION: Composite: . Then Draws a purple line from (95, 236) to (99, 126). Then Draws a blue circle centered at (168, 155) with radius 59.
; PLAN: r0=95(x1), r1=236(y1), r2=99(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=155(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (95, 236) to (99, 126).
; PLAN: r0=95(x1), r1=236(y1), r2=99(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 236
LDI r2, 99
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (168, 155) with radius 59.
; PLAN: r0=168(x), r1=155(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 155
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
