; DESCRIPTION: Composite: . Then Places a blue line segment connecting (42, 179) to (54, 192). Then Draws a yellow circle centered at (91, 85) with radius 78.
; PLAN: r0=42(x1), r1=179(y1), r2=54(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=85(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (42, 179) to (54, 192).
; PLAN: r0=42(x1), r1=179(y1), r2=54(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 179
LDI r2, 54
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (91, 85) with radius 78.
; PLAN: r0=91(x), r1=85(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 85
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
