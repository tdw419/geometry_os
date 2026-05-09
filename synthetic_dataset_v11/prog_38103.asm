; DESCRIPTION: Composite: . Then Draws a green line from (119, 76) to (161, 10). Then Places a magenta circle of radius 42 at center (198, 201).
; PLAN: r0=119(x1), r1=76(y1), r2=161(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=198(x), r1=201(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (119, 76) to (161, 10).
; PLAN: r0=119(x1), r1=76(y1), r2=161(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 76
LDI r2, 161
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 42 at center (198, 201).
; PLAN: r0=198(x), r1=201(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 201
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
