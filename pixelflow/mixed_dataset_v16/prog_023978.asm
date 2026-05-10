; DESCRIPTION: Composite: Draws a purple line from (307, 132) to (460, 49) then Sets a single red pixel at (333, 200) then Renders a yellow box of size 89x35 starting at (134, 139).
; PLAN: r0=307(x1), r1=132(y1), r2=460(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=139(y), r12=89(width), r13=35(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 132
LDI r2, 460
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 134
LDI r11, 139
LDI r12, 89
LDI r13, 35
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
