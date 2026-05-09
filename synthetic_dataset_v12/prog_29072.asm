; DESCRIPTION: Composite: Renders a purple line between points (1, 44) and (220, 196) then Draws a white rectangle at (261, 62) with width 57 and height 91 then Sets a single yellow pixel at (141, 97).
; PLAN: r0=1(x1), r1=44(y1), r2=220(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=62(y), r7=57(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=97(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 44
LDI r2, 220
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 62
LDI r7, 57
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 97
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
