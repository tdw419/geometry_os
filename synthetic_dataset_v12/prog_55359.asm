; DESCRIPTION: Composite: Places a red dot at position (329, 175) then Draws a green line from (153, 234) to (33, 222).
; PLAN: r0=329(x), r1=175(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=153(x1), r6=234(y1), r7=33(x2), r8=222(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 175
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 234
LDI r7, 33
LDI r8, 222
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
