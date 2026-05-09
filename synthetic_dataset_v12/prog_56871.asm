; DESCRIPTION: Composite: Places a cyan 100x77 rectangle at position (404, 39) then Places a black line segment connecting (106, 217) to (350, 87) then Sets a single cyan pixel at (280, 61).
; PLAN: r0=404(x), r1=39(y), r2=100(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=217(y1), r7=350(x2), r8=87(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=61(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 39
LDI r2, 100
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 217
LDI r7, 350
LDI r8, 87
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 61
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
