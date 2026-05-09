; DESCRIPTION: Composite: Sets a single green pixel at (208, 137) then Places a white line segment connecting (380, 122) to (456, 24).
; PLAN: r0=208(x), r1=137(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=122(y1), r7=456(x2), r8=24(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 137
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 122
LDI r7, 456
LDI r8, 24
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
