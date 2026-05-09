; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (94, 59) with radius 59. Then Places a green line segment connecting (80, 16) to (65, 56).
; PLAN: r0=94(x), r1=59(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=80(x1), r1=16(y1), r2=65(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (94, 59) with radius 59.
; PLAN: r0=94(x), r1=59(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 59
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (80, 16) to (65, 56).
; PLAN: r0=80(x1), r1=16(y1), r2=65(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 16
LDI r2, 65
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
