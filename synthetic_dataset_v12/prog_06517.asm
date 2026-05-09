; DESCRIPTION: Composite: Renders a black line between points (198, 242) and (88, 144) then Draws a magenta circle centered at (83, 62) with radius 28.
; PLAN: r0=198(x1), r1=242(y1), r2=88(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=62(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 242
LDI r2, 88
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 62
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
