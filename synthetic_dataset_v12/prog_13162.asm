; DESCRIPTION: Composite: Places a purple line segment connecting (388, 139) to (39, 0) then Places a orange 57x48 rectangle at position (80, 12) then Sets a single white pixel at (467, 0).
; PLAN: r0=388(x1), r1=139(y1), r2=39(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=12(y), r7=57(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x), r11=0(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 139
LDI r2, 39
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 12
LDI r7, 57
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 0
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
