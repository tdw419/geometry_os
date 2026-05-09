; DESCRIPTION: Composite: Places a purple dot at position (368, 244) then Draws a white line from (56, 119) to (288, 39).
; PLAN: r0=368(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=119(y1), r7=288(x2), r8=39(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 119
LDI r7, 288
LDI r8, 39
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
