; DESCRIPTION: Composite: Draws a yellow rectangle at (196, 54) with width 71 and height 62 then Renders a purple line between points (33, 191) and (445, 171) then Sets a single orange pixel at (256, 84).
; PLAN: r0=196(x), r1=54(y), r2=71(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=191(y1), r7=445(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=84(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 54
LDI r2, 71
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 191
LDI r7, 445
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 84
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
