; DESCRIPTION: Composite: Draws a yellow rectangle at (398, 49) with width 44 and height 103 then Renders a orange line between points (40, 108) and (26, 44) then Sets a single purple pixel at (202, 213).
; PLAN: r0=398(x), r1=49(y), r2=44(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=108(y1), r7=26(x2), r8=44(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=213(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 49
LDI r2, 44
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 108
LDI r7, 26
LDI r8, 44
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 213
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
