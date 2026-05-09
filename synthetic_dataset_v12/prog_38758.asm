; DESCRIPTION: Composite: Sets a single orange pixel at (252, 247) then Draws a white line from (255, 160) to (319, 152).
; PLAN: r0=252(x), r1=247(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=160(y1), r7=319(x2), r8=152(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 247
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 255
LDI r6, 160
LDI r7, 319
LDI r8, 152
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
