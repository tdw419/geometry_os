; DESCRIPTION: Composite: Sets a single blue pixel at (121, 134) then Renders a white disk with center (249, 132) and radius 78 then Places a yellow line segment connecting (146, 124) to (268, 30).
; PLAN: r0=121(x), r1=134(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=132(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=124(y1), r12=268(x2), r13=30(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 134
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 132
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 124
LDI r12, 268
LDI r13, 30
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
