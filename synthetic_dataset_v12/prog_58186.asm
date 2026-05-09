; DESCRIPTION: Composite: Sets a single blue pixel at (409, 110) then Renders a purple box of size 108x12 starting at (208, 168) then Places a black line segment connecting (95, 82) to (326, 135).
; PLAN: r0=409(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=168(y), r7=108(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x1), r11=82(y1), r12=326(x2), r13=135(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 168
LDI r7, 108
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 82
LDI r12, 326
LDI r13, 135
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
