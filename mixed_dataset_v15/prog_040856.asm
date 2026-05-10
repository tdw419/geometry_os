; DESCRIPTION: Composite: Draws a orange line from (107, 36) to (204, 62) then Places a magenta dot at position (354, 96).
; PLAN: r0=107(x1), r1=36(y1), r2=204(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=96(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 36
LDI r2, 204
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 96
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
