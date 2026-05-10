; DESCRIPTION: Draws a green line from (498, 108) to (5, 94).
; PLAN: r0=498(x1), r1=108(y1), r2=5(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 108
LDI r2, 5
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
