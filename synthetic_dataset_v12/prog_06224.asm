; DESCRIPTION: Composite: Draws a orange line from (166, 181) to (126, 63) then Places a magenta dot at position (475, 40).
; PLAN: r0=166(x1), r1=181(y1), r2=126(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=40(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 181
LDI r2, 126
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 40
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
