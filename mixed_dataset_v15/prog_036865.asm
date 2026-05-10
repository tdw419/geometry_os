; DESCRIPTION: Composite: Draws a black line from (392, 209) to (174, 159) then Renders a blue box of size 10x80 starting at (457, 13) then Sets a single purple pixel at (22, 60).
; PLAN: r0=392(x1), r1=209(y1), r2=174(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=13(y), r7=10(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=60(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 209
LDI r2, 174
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 13
LDI r7, 10
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 60
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
