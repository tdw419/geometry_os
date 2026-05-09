; DESCRIPTION: Composite: Creates a blue rectangular region at (450, 33) spanning 56 by 44 pixels then Draws a red line from (184, 69) to (185, 77) then Places a orange dot at position (493, 139).
; PLAN: r0=450(x), r1=33(y), r2=56(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=69(y1), r7=185(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=139(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 33
LDI r2, 56
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 69
LDI r7, 185
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 139
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
