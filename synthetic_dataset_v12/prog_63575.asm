; DESCRIPTION: Draws a orange line from (391, 240) to (131, 57).
; PLAN: r0=391(x1), r1=240(y1), r2=131(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 240
LDI r2, 131
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
