; DESCRIPTION: Composite: Renders a purple box of size 89x61 starting at (132, 100) then Sets a single cyan pixel at (142, 40) then Places a magenta line segment connecting (165, 162) to (279, 212).
; PLAN: r0=132(x), r1=100(y), r2=89(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=40(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=165(x1), r11=162(y1), r12=279(x2), r13=212(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 100
LDI r2, 89
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 40
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 162
LDI r12, 279
LDI r13, 212
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
