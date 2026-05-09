; DESCRIPTION: Draws a blue line from (46, 94) to (111, 89).
; PLAN: r0=46(x1), r1=94(y1), r2=111(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 94
LDI r2, 111
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
