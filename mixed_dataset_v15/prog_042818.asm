; DESCRIPTION: Composite: Draws a magenta line from (90, 145) to (350, 237) then Draws a cyan rectangle at (193, 8) with width 74 and height 92 then Places a purple circle of radius 38 at center (368, 67).
; PLAN: r0=90(x1), r1=145(y1), r2=350(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=8(y), r7=74(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=67(y), r12=38(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 145
LDI r2, 350
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 8
LDI r7, 74
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 67
LDI r12, 38
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
