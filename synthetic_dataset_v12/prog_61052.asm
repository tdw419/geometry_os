; DESCRIPTION: Composite: Renders a orange line between points (243, 26) and (306, 41) then Draws a red rectangle at (324, 186) with width 107 and height 61 then Sets a single purple pixel at (202, 166).
; PLAN: r0=243(x1), r1=26(y1), r2=306(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=186(y), r7=107(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x), r11=166(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 26
LDI r2, 306
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 186
LDI r7, 107
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 166
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
