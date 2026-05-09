; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (144, 160) with radius 60. Then Renders a magenta line between points (247, 42) and (139, 78).
; PLAN: r0=144(x), r1=160(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=247(x1), r1=42(y1), r2=139(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (144, 160) with radius 60.
; PLAN: r0=144(x), r1=160(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 160
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (247, 42) and (139, 78).
; PLAN: r0=247(x1), r1=42(y1), r2=139(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 42
LDI r2, 139
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
