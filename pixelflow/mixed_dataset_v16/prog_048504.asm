; DESCRIPTION: Composite: Places a red dot at position (45, 227) then Places a magenta line segment connecting (283, 231) to (117, 72).
; PLAN: r0=45(x), r1=227(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=231(y1), r7=117(x2), r8=72(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 227
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 283
LDI r6, 231
LDI r7, 117
LDI r8, 72
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
