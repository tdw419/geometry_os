; DESCRIPTION: Composite: Sets a single blue pixel at (391, 247) then Places a purple line segment connecting (210, 65) to (48, 46) then Draws a cyan circle centered at (92, 188) with radius 67.
; PLAN: r0=391(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=210(x1), r6=65(y1), r7=48(x2), r8=46(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=188(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 247
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 65
LDI r7, 48
LDI r8, 46
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 188
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
