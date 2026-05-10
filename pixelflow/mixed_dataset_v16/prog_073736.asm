; DESCRIPTION: Composite: Sets a single green pixel at (132, 218) then Renders a orange line between points (289, 55) and (406, 70).
; PLAN: r0=132(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=55(y1), r7=406(x2), r8=70(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 55
LDI r7, 406
LDI r8, 70
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
