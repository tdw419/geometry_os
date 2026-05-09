; DESCRIPTION: Composite: Places a white dot at position (278, 237) then Places a red line segment connecting (331, 255) to (360, 77).
; PLAN: r0=278(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=255(y1), r7=360(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 255
LDI r7, 360
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
