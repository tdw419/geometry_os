; DESCRIPTION: Composite: Sets a single orange pixel at (92, 13) then Places a purple line segment connecting (385, 81) to (345, 201) then Renders a purple box of size 92x49 starting at (59, 73).
; PLAN: r0=92(x), r1=13(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=81(y1), r7=345(x2), r8=201(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=73(y), r12=92(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 13
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 81
LDI r7, 345
LDI r8, 201
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 73
LDI r12, 92
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
