; DESCRIPTION: Composite: Draws a cyan rectangle at (266, 67) with width 75 and height 101 then Places a red dot at position (362, 182) then Draws a blue line from (27, 119) to (188, 128).
; PLAN: r0=266(x), r1=67(y), r2=75(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=182(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=27(x1), r11=119(y1), r12=188(x2), r13=128(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 67
LDI r2, 75
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 182
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 27
LDI r11, 119
LDI r12, 188
LDI r13, 128
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
