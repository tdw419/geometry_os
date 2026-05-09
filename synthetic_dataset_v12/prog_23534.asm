; DESCRIPTION: Composite: Renders a yellow disk with center (101, 36) and radius 13 then Draws a purple line from (140, 50) to (340, 143) then Places a magenta dot at position (205, 8).
; PLAN: r0=101(x), r1=36(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=50(y1), r7=340(x2), r8=143(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=8(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 36
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 50
LDI r7, 340
LDI r8, 143
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 8
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
