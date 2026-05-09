; DESCRIPTION: Composite: Sets a single green pixel at (69, 40) then Draws a white line from (306, 205) to (424, 45).
; PLAN: r0=69(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=205(y1), r7=424(x2), r8=45(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 306
LDI r6, 205
LDI r7, 424
LDI r8, 45
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
