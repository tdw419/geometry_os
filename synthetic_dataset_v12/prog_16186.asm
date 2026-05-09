; DESCRIPTION: Composite: Renders a black box of size 72x66 starting at (408, 118) then Draws a blue line from (52, 202) to (203, 85) then Sets a single cyan pixel at (310, 16).
; PLAN: r0=408(x), r1=118(y), r2=72(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x1), r6=202(y1), r7=203(x2), r8=85(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=16(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 118
LDI r2, 72
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 202
LDI r7, 203
LDI r8, 85
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 16
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
