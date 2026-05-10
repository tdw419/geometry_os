; DESCRIPTION: Composite: Places a cyan line segment connecting (362, 6) to (334, 116) then Places a red dot at position (56, 44) then Draws a purple rectangle at (363, 46) with width 114 and height 59.
; PLAN: r0=362(x1), r1=6(y1), r2=334(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=44(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=46(y), r12=114(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 6
LDI r2, 334
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 44
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 363
LDI r11, 46
LDI r12, 114
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
