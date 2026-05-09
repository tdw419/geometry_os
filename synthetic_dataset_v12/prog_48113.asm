; DESCRIPTION: Composite: Places a blue dot at position (314, 189) then Draws a white line from (159, 197) to (301, 23).
; PLAN: r0=314(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=197(y1), r7=301(x2), r8=23(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 197
LDI r7, 301
LDI r8, 23
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
