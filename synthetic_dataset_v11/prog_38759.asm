; DESCRIPTION: Composite: . Then Draws a black circle centered at (165, 168) with radius 66. Then Places a magenta line segment connecting (169, 254) to (11, 218).
; PLAN: r0=165(x), r1=168(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=169(x1), r1=254(y1), r2=11(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (165, 168) with radius 66.
; PLAN: r0=165(x), r1=168(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 168
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (169, 254) to (11, 218).
; PLAN: r0=169(x1), r1=254(y1), r2=11(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 254
LDI r2, 11
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
