; DESCRIPTION: Composite: Sets a single green pixel at (121, 46) then Draws a orange line from (54, 175) to (104, 50).
; PLAN: r0=121(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=175(y1), r7=104(x2), r8=50(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 54
LDI r6, 175
LDI r7, 104
LDI r8, 50
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
