; DESCRIPTION: Composite: Renders a yellow line between points (506, 234) and (406, 39) then Draws a black circle centered at (135, 149) with radius 71.
; PLAN: r0=506(x1), r1=234(y1), r2=406(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=149(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 234
LDI r2, 406
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 149
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
