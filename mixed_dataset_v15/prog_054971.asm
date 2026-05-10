; DESCRIPTION: Composite: Places a blue line segment connecting (270, 95) to (12, 10) then Draws a white circle centered at (388, 71) with radius 36 then Sets a single purple pixel at (280, 213).
; PLAN: r0=270(x1), r1=95(y1), r2=12(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=71(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=213(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 95
LDI r2, 12
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 71
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 213
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
