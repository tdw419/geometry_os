; DESCRIPTION: Composite: Renders a cyan line between points (75, 130) and (127, 251) then Draws a cyan circle centered at (379, 155) with radius 67.
; PLAN: r0=75(x1), r1=130(y1), r2=127(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=155(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 130
LDI r2, 127
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 155
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
