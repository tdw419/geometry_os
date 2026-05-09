; DESCRIPTION: Composite: Sets a single green pixel at (392, 166) then Places a purple line segment connecting (229, 83) to (379, 152).
; PLAN: r0=392(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=83(y1), r7=379(x2), r8=152(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 83
LDI r7, 379
LDI r8, 152
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
