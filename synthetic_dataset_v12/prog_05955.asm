; DESCRIPTION: Draws a white line from (52, 39) to (391, 35).
; PLAN: r0=52(x1), r1=39(y1), r2=391(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 39
LDI r2, 391
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
