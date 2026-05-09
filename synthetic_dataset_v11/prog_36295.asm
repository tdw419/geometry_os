; DESCRIPTION: Composite: . Then Renders a magenta line between points (46, 184) and (224, 71). Then Creates a purple circular shape at (60, 156) with radius 12.
; PLAN: r0=46(x1), r1=184(y1), r2=224(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=156(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (46, 184) and (224, 71).
; PLAN: r0=46(x1), r1=184(y1), r2=224(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 184
LDI r2, 224
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (60, 156) with radius 12.
; PLAN: r0=60(x), r1=156(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 156
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
