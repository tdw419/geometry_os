; DESCRIPTION: Composite: Renders a red line between points (298, 229) and (110, 222) then Renders a magenta box of size 63x90 starting at (51, 158) then Places a blue dot at position (136, 24).
; PLAN: r0=298(x1), r1=229(y1), r2=110(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=158(y), r7=63(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=24(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 229
LDI r2, 110
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 158
LDI r7, 63
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 24
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
