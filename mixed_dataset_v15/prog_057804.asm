; DESCRIPTION: Composite: Places a cyan circle of radius 68 at center (404, 188) then Renders a orange line between points (191, 46) and (79, 85) then Sets a single black pixel at (150, 242).
; PLAN: r0=404(x), r1=188(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=46(y1), r7=79(x2), r8=85(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=242(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 188
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 46
LDI r7, 79
LDI r8, 85
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 242
LDI r12, 0x000000
PSET r10, r11, r12
HALT
