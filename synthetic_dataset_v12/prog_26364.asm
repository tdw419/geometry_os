; DESCRIPTION: Composite: Draws a blue line from (190, 28) to (195, 92) then Creates a black rectangular region at (96, 27) spanning 24 by 74 pixels then Sets a single red pixel at (130, 127).
; PLAN: r0=190(x1), r1=28(y1), r2=195(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=27(y), r7=24(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x), r11=127(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 28
LDI r2, 195
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 27
LDI r7, 24
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 127
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
