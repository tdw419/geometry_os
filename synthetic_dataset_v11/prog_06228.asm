; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (54, 97) with radius 44. Then Renders a yellow line between points (126, 198) and (45, 181).
; PLAN: r0=54(x), r1=97(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x1), r1=198(y1), r2=45(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (54, 97) with radius 44.
; PLAN: r0=54(x), r1=97(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 97
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (126, 198) and (45, 181).
; PLAN: r0=126(x1), r1=198(y1), r2=45(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 198
LDI r2, 45
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
