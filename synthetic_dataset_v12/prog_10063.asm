; DESCRIPTION: Composite: Renders a orange line between points (303, 155) and (231, 230) then Draws a cyan circle centered at (420, 65) with radius 51.
; PLAN: r0=303(x1), r1=155(y1), r2=231(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=65(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 155
LDI r2, 231
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 65
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
