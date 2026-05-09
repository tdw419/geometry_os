; DESCRIPTION: Composite: Renders a orange line between points (195, 107) and (458, 254) then Draws a blue rectangle at (306, 126) with width 27 and height 27.
; PLAN: r0=195(x1), r1=107(y1), r2=458(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=126(y), r7=27(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 107
LDI r2, 458
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 126
LDI r7, 27
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
