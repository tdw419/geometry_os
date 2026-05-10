; DESCRIPTION: Composite: Sets a single green pixel at (216, 46) then Places a black line segment connecting (249, 24) to (510, 107) then Renders a blue box of size 118x33 starting at (330, 25).
; PLAN: r0=216(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x1), r6=24(y1), r7=510(x2), r8=107(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=25(y), r12=118(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 24
LDI r7, 510
LDI r8, 107
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 25
LDI r12, 118
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
