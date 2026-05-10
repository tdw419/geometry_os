; DESCRIPTION: Composite: Renders a orange line between points (355, 48) and (420, 15) then Places a magenta dot at position (78, 188).
; PLAN: r0=355(x1), r1=48(y1), r2=420(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=188(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 48
LDI r2, 420
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 188
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
