; DESCRIPTION: Composite: Renders a purple line between points (240, 33) and (353, 130) then Draws a cyan circle centered at (102, 102) with radius 48.
; PLAN: r0=240(x1), r1=33(y1), r2=353(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=102(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 33
LDI r2, 353
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 102
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
