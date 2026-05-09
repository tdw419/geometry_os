; DESCRIPTION: Draws a blue line from (496, 104) to (410, 89).
; PLAN: r0=496(x1), r1=104(y1), r2=410(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 104
LDI r2, 410
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
