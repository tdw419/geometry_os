; DESCRIPTION: Composite: Places a white 74x64 rectangle at position (424, 84) then Renders a orange line between points (391, 230) and (335, 132) then Places a purple dot at position (153, 186).
; PLAN: r0=424(x), r1=84(y), r2=74(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=230(y1), r7=335(x2), r8=132(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=186(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 84
LDI r2, 74
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 230
LDI r7, 335
LDI r8, 132
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 186
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
