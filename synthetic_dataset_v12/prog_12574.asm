; DESCRIPTION: Composite: Places a green dot at position (231, 153) then Places a purple line segment connecting (369, 25) to (341, 120) then Renders a black box of size 14x120 starting at (45, 69).
; PLAN: r0=231(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=25(y1), r7=341(x2), r8=120(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=69(y), r12=14(width), r13=120(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 369
LDI r6, 25
LDI r7, 341
LDI r8, 120
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 69
LDI r12, 14
LDI r13, 120
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
