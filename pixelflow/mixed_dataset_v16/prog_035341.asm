; DESCRIPTION: Composite: Places a red dot at position (251, 226) then Draws a orange line from (416, 161) to (490, 88).
; PLAN: r0=251(x), r1=226(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=416(x1), r6=161(y1), r7=490(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 226
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 161
LDI r7, 490
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
