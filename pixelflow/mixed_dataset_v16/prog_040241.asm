; DESCRIPTION: Composite: Places a black dot at position (451, 194) then Draws a blue line from (489, 171) to (275, 91).
; PLAN: r0=451(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=171(y1), r7=275(x2), r8=91(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 489
LDI r6, 171
LDI r7, 275
LDI r8, 91
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
