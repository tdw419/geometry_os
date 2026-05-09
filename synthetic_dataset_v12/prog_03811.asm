; DESCRIPTION: Composite: Renders a green line between points (178, 244) and (501, 78) then Places a magenta circle of radius 52 at center (173, 152).
; PLAN: r0=178(x1), r1=244(y1), r2=501(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=152(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 244
LDI r2, 501
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 152
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
