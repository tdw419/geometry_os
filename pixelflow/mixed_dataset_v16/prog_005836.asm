; DESCRIPTION: Composite: Places a orange line segment connecting (212, 236) to (291, 86) then Places a red dot at position (25, 57).
; PLAN: r0=212(x1), r1=236(y1), r2=291(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=57(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 236
LDI r2, 291
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 57
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
