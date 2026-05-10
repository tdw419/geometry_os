; DESCRIPTION: Composite: Sets a single blue pixel at (132, 50) then Places a green 24x112 rectangle at position (39, 46) then Draws a red line from (84, 52) to (98, 129).
; PLAN: r0=132(x), r1=50(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=46(y), r7=24(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x1), r11=52(y1), r12=98(x2), r13=129(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 50
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 46
LDI r7, 24
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 52
LDI r12, 98
LDI r13, 129
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
