; DESCRIPTION: Composite: Places a green line segment connecting (200, 185) to (33, 244) then Creates a magenta circular shape at (374, 188) with radius 64.
; PLAN: r0=200(x1), r1=185(y1), r2=33(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=188(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 200
LDI r1, 185
LDI r2, 33
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 188
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
