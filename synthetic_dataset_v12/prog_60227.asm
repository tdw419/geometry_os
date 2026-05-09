; DESCRIPTION: Composite: Places a cyan circle of radius 59 at center (426, 116) then Draws a green line from (144, 123) to (154, 253) then Sets a single black pixel at (272, 188).
; PLAN: r0=426(x), r1=116(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=123(y1), r7=154(x2), r8=253(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=188(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 116
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 123
LDI r7, 154
LDI r8, 253
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 188
LDI r12, 0x000000
PSET r10, r11, r12
HALT
