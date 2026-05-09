; DESCRIPTION: Composite: Places a cyan dot at position (321, 23) then Draws a purple line from (60, 96) to (309, 175) then Places a purple circle of radius 68 at center (274, 168).
; PLAN: r0=321(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=96(y1), r7=309(x2), r8=175(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=168(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 96
LDI r7, 309
LDI r8, 175
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 168
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
