; DESCRIPTION: Composite: Places a red line segment connecting (465, 110) to (221, 184) then Places a orange dot at position (103, 192).
; PLAN: r0=465(x1), r1=110(y1), r2=221(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 110
LDI r2, 221
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
