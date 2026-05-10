; DESCRIPTION: Draws a green line from (500, 27) to (508, 172).
; PLAN: r0=500(x1), r1=27(y1), r2=508(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 27
LDI r2, 508
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
