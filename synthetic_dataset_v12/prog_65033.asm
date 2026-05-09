; DESCRIPTION: Composite: Draws a purple line from (33, 187) to (126, 9) then Places a purple dot at position (422, 164).
; PLAN: r0=33(x1), r1=187(y1), r2=126(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=164(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 187
LDI r2, 126
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 164
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
