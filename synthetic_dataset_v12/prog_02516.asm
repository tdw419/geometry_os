; DESCRIPTION: Composite: Draws a purple line from (497, 255) to (33, 189) then Renders a green disk with center (337, 157) and radius 78.
; PLAN: r0=497(x1), r1=255(y1), r2=33(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=157(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 255
LDI r2, 33
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 157
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
