; DESCRIPTION: Composite: Places a cyan dot at position (363, 140) then Draws a magenta line from (474, 242) to (397, 148) then Renders a blue disk with center (85, 165) and radius 14.
; PLAN: r0=363(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=242(y1), r7=397(x2), r8=148(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=165(y), r12=14(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 242
LDI r7, 397
LDI r8, 148
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 165
LDI r12, 14
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
