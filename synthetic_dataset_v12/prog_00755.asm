; DESCRIPTION: Composite: Sets a single orange pixel at (480, 93) then Draws a purple line from (373, 30) to (98, 170) then Places a white circle of radius 50 at center (96, 162).
; PLAN: r0=480(x), r1=93(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=30(y1), r7=98(x2), r8=170(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=162(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 480
LDI r1, 93
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 373
LDI r6, 30
LDI r7, 98
LDI r8, 170
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 162
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
