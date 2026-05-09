; DESCRIPTION: Composite: Draws a blue rectangle at (283, 145) with width 51 and height 47 then Renders a green line between points (2, 100) and (345, 16) then Sets a single yellow pixel at (35, 213).
; PLAN: r0=283(x), r1=145(y), r2=51(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=100(y1), r7=345(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=213(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 145
LDI r2, 51
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 100
LDI r7, 345
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 213
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
