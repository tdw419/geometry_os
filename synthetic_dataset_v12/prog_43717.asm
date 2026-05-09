; DESCRIPTION: Composite: Places a blue dot at position (272, 59) then Draws a yellow line from (162, 45) to (309, 110) then Renders a cyan disk with center (79, 154) and radius 64.
; PLAN: r0=272(x), r1=59(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=45(y1), r7=309(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=154(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 59
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 45
LDI r7, 309
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 154
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
