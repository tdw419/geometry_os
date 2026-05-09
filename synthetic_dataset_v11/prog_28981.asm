; DESCRIPTION: Composite: . Then Draws a purple circle centered at (187, 132) with radius 50. Then Places a purple line segment connecting (168, 192) to (59, 202).
; PLAN: r0=187(x), r1=132(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x1), r1=192(y1), r2=59(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (187, 132) with radius 50.
; PLAN: r0=187(x), r1=132(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 132
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (168, 192) to (59, 202).
; PLAN: r0=168(x1), r1=192(y1), r2=59(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 192
LDI r2, 59
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
