; DESCRIPTION: Composite: Creates a purple rectangular region at (247, 72) spanning 88 by 54 pixels then Places a red dot at position (366, 69) then Draws a cyan line from (96, 213) to (151, 170).
; PLAN: r0=247(x), r1=72(y), r2=88(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=69(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=213(y1), r12=151(x2), r13=170(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 72
LDI r2, 88
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 69
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 96
LDI r11, 213
LDI r12, 151
LDI r13, 170
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
