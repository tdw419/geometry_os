; DESCRIPTION: Composite: . Then Draws a black line from (191, 248) to (147, 96). Then Creates a magenta circular shape at (219, 38) with radius 30.
; PLAN: r0=191(x1), r1=248(y1), r2=147(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=219(x), r1=38(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (191, 248) to (147, 96).
; PLAN: r0=191(x1), r1=248(y1), r2=147(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 248
LDI r2, 147
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (219, 38) with radius 30.
; PLAN: r0=219(x), r1=38(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 38
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
