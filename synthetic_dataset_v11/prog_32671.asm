; DESCRIPTION: Composite: . Then Draws a purple circle centered at (85, 82) with radius 66. Then Draws a green line from (244, 166) to (120, 22).
; PLAN: r0=85(x), r1=82(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=244(x1), r1=166(y1), r2=120(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (85, 82) with radius 66.
; PLAN: r0=85(x), r1=82(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 82
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (244, 166) to (120, 22).
; PLAN: r0=244(x1), r1=166(y1), r2=120(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 166
LDI r2, 120
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
