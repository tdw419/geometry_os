; DESCRIPTION: Composite: Sets a single green pixel at (159, 67) then Places a purple line segment connecting (260, 6) to (275, 68) then Renders a purple box of size 63x89 starting at (153, 71).
; PLAN: r0=159(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=6(y1), r7=275(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=71(y), r12=63(width), r13=89(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 6
LDI r7, 275
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 71
LDI r12, 63
LDI r13, 89
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
