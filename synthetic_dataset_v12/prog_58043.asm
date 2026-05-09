; DESCRIPTION: Composite: Places a black line segment connecting (272, 179) to (101, 38) then Renders a blue box of size 81x55 starting at (237, 52) then Places a blue dot at position (367, 8).
; PLAN: r0=272(x1), r1=179(y1), r2=101(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=52(y), r7=81(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=8(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 179
LDI r2, 101
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 52
LDI r7, 81
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 8
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
