; DESCRIPTION: Composite: Places a green dot at position (373, 127) then Draws a orange line from (193, 34) to (214, 162).
; PLAN: r0=373(x), r1=127(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=34(y1), r7=214(x2), r8=162(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 127
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 193
LDI r6, 34
LDI r7, 214
LDI r8, 162
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
