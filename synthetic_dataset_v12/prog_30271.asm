; DESCRIPTION: Composite: Creates a green rectangular region at (153, 149) spanning 120 by 80 pixels then Places a magenta line segment connecting (203, 83) to (111, 55) then Sets a single orange pixel at (450, 83).
; PLAN: r0=153(x), r1=149(y), r2=120(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=83(y1), r7=111(x2), r8=55(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=83(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 149
LDI r2, 120
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 83
LDI r7, 111
LDI r8, 55
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 83
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
