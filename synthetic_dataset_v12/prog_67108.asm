; DESCRIPTION: Composite: Draws a purple line from (264, 81) to (183, 27) then Places a purple dot at position (365, 129).
; PLAN: r0=264(x1), r1=81(y1), r2=183(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=129(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 81
LDI r2, 183
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 129
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
