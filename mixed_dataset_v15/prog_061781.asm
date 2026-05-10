; DESCRIPTION: Composite: Draws a magenta line from (472, 194) to (501, 54) then Places a yellow dot at position (349, 77).
; PLAN: r0=472(x1), r1=194(y1), r2=501(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=77(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 472
LDI r1, 194
LDI r2, 501
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 77
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
