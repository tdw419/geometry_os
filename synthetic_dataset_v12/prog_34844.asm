; DESCRIPTION: Composite: Places a purple dot at position (221, 59) then Renders a blue line between points (211, 160) and (207, 19).
; PLAN: r0=221(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x1), r6=160(y1), r7=207(x2), r8=19(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 160
LDI r7, 207
LDI r8, 19
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
