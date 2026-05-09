; DESCRIPTION: Composite: Draws a blue line from (220, 102) to (282, 71) then Draws a cyan rectangle at (106, 62) with width 12 and height 56 then Sets a single yellow pixel at (405, 71).
; PLAN: r0=220(x1), r1=102(y1), r2=282(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=62(y), r7=12(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=71(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 102
LDI r2, 282
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 62
LDI r7, 12
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 71
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
