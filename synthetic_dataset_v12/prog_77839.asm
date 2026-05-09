; DESCRIPTION: Draws a yellow line from (95, 94) to (349, 210).
; PLAN: r0=95(x1), r1=94(y1), r2=349(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 94
LDI r2, 349
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
