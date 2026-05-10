; DESCRIPTION: Composite: Draws a purple line from (339, 139) to (465, 198) then Places a yellow dot at position (283, 222).
; PLAN: r0=339(x1), r1=139(y1), r2=465(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=222(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 139
LDI r2, 465
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 222
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
