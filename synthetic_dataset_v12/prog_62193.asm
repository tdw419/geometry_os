; DESCRIPTION: Composite: Sets a single green pixel at (119, 135) then Places a purple line segment connecting (164, 172) to (283, 209).
; PLAN: r0=119(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=172(y1), r7=283(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 172
LDI r7, 283
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
