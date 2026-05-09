; DESCRIPTION: Composite: Draws a blue line from (315, 220) to (391, 22) then Places a cyan dot at position (399, 54) then Places a magenta 22x39 rectangle at position (85, 153).
; PLAN: r0=315(x1), r1=220(y1), r2=391(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=54(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=153(y), r12=22(width), r13=39(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 220
LDI r2, 391
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 54
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 85
LDI r11, 153
LDI r12, 22
LDI r13, 39
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
