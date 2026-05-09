; DESCRIPTION: Composite: . Then Draws a purple circle centered at (82, 65) with radius 35. Then Places a magenta line segment connecting (59, 139) to (16, 15).
; PLAN: r0=82(x), r1=65(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=59(x1), r1=139(y1), r2=16(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (82, 65) with radius 35.
; PLAN: r0=82(x), r1=65(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 65
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (59, 139) to (16, 15).
; PLAN: r0=59(x1), r1=139(y1), r2=16(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 139
LDI r2, 16
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
