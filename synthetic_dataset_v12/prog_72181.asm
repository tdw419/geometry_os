; DESCRIPTION: Composite: Draws a white line from (441, 110) to (383, 200) then Draws a magenta rectangle at (2, 3) with width 70 and height 90 then Sets a single orange pixel at (467, 87).
; PLAN: r0=441(x1), r1=110(y1), r2=383(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=3(y), r7=70(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x), r11=87(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 110
LDI r2, 383
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 3
LDI r7, 70
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 87
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
