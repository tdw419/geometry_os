; DESCRIPTION: Composite: Sets a single white pixel at (306, 220) then Places a cyan line segment connecting (435, 218) to (364, 73).
; PLAN: r0=306(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=218(y1), r7=364(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 218
LDI r7, 364
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
