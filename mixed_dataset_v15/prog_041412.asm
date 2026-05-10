; DESCRIPTION: Composite: Places a green line segment connecting (173, 212) to (362, 126) then Sets a single purple pixel at (177, 255) then Draws a blue rectangle at (70, 71) with width 81 and height 64.
; PLAN: r0=173(x1), r1=212(y1), r2=362(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=255(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=70(x), r11=71(y), r12=81(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 212
LDI r2, 362
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 255
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 70
LDI r11, 71
LDI r12, 81
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
