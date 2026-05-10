; DESCRIPTION: Composite: Places a green line segment connecting (408, 140) to (229, 179) then Renders a purple box of size 108x81 starting at (112, 72) then Places a red dot at position (51, 96).
; PLAN: r0=408(x1), r1=140(y1), r2=229(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=72(y), r7=108(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=51(x), r11=96(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 140
LDI r2, 229
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 72
LDI r7, 108
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 96
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
