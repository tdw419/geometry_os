; DESCRIPTION: Composite: Sets a single cyan pixel at (298, 86) then Places a purple line segment connecting (325, 116) to (191, 23).
; PLAN: r0=298(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=325(x1), r6=116(y1), r7=191(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 116
LDI r7, 191
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
