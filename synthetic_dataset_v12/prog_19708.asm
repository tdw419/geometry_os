; DESCRIPTION: Composite: Sets a single yellow pixel at (335, 61) then Places a red 77x77 rectangle at position (204, 83) then Places a purple line segment connecting (42, 37) to (275, 180).
; PLAN: r0=335(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=83(y), r7=77(width), r8=77(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x1), r11=37(y1), r12=275(x2), r13=180(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 61
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 204
LDI r6, 83
LDI r7, 77
LDI r8, 77
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 37
LDI r12, 275
LDI r13, 180
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
