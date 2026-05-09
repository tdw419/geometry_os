; DESCRIPTION: Composite: Places a black line segment connecting (477, 10) to (75, 209) then Draws a green rectangle at (193, 39) with width 36 and height 117 then Places a purple dot at position (108, 246).
; PLAN: r0=477(x1), r1=10(y1), r2=75(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=39(y), r7=36(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=246(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 10
LDI r2, 75
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 39
LDI r7, 36
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 246
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
