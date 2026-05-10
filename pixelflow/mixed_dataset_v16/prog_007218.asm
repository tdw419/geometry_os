; DESCRIPTION: Composite: Draws a red rectangle at (63, 116) with width 30 and height 82 then Draws a green line from (162, 9) to (486, 75) then Sets a single yellow pixel at (228, 119).
; PLAN: r0=63(x), r1=116(y), r2=30(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x1), r6=9(y1), r7=486(x2), r8=75(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=119(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 116
LDI r2, 30
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 9
LDI r7, 486
LDI r8, 75
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 119
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
