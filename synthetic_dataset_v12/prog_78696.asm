; DESCRIPTION: Composite: Sets a single green pixel at (258, 131) then Renders a magenta box of size 94x69 starting at (273, 40) then Places a purple line segment connecting (271, 48) to (447, 237).
; PLAN: r0=258(x), r1=131(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=40(y), r7=94(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x1), r11=48(y1), r12=447(x2), r13=237(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 131
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 273
LDI r6, 40
LDI r7, 94
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 48
LDI r12, 447
LDI r13, 237
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
