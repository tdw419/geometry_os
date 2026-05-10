; DESCRIPTION: Composite: Draws a red line from (500, 97) to (39, 17) then Places a orange dot at position (196, 240).
; PLAN: r0=500(x1), r1=97(y1), r2=39(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 500
LDI r1, 97
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
