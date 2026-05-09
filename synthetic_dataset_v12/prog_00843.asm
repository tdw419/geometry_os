; DESCRIPTION: Composite: Renders a cyan box of size 88x96 starting at (144, 2) then Draws a black line from (285, 37) to (76, 94) then Places a cyan dot at position (70, 252).
; PLAN: r0=144(x), r1=2(y), r2=88(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x1), r6=37(y1), r7=76(x2), r8=94(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=252(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 2
LDI r2, 88
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 37
LDI r7, 76
LDI r8, 94
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 252
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
