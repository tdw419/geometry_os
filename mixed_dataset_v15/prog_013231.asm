; DESCRIPTION: Composite: Places a green dot at position (501, 247) then Draws a purple line from (283, 165) to (27, 101).
; PLAN: r0=501(x), r1=247(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=165(y1), r7=27(x2), r8=101(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 247
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 283
LDI r6, 165
LDI r7, 27
LDI r8, 101
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
