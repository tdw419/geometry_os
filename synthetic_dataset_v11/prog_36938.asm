; DESCRIPTION: Composite: . Then Draws a purple circle centered at (103, 179) with radius 23. Then Draws a blue line from (150, 154) to (45, 102).
; PLAN: r0=103(x), r1=179(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x1), r1=154(y1), r2=45(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (103, 179) with radius 23.
; PLAN: r0=103(x), r1=179(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 179
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (150, 154) to (45, 102).
; PLAN: r0=150(x1), r1=154(y1), r2=45(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 154
LDI r2, 45
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
