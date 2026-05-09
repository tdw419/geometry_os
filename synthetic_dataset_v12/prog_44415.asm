; DESCRIPTION: Composite: Draws a blue line from (277, 39) to (436, 89) then Sets a single orange pixel at (23, 20) then Renders a purple box of size 109x81 starting at (206, 131).
; PLAN: r0=277(x1), r1=39(y1), r2=436(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=20(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=131(y), r12=109(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 39
LDI r2, 436
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 20
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 206
LDI r11, 131
LDI r12, 109
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
