; DESCRIPTION: Composite: Renders a white box of size 36x24 starting at (266, 120) then Draws a black line from (463, 217) to (138, 97) then Sets a single red pixel at (210, 6).
; PLAN: r0=266(x), r1=120(y), r2=36(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=217(y1), r7=138(x2), r8=97(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=6(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 120
LDI r2, 36
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 217
LDI r7, 138
LDI r8, 97
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 6
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
