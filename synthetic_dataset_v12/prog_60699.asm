; DESCRIPTION: Draws a blue line from (401, 57) to (25, 159).
; PLAN: r0=401(x1), r1=57(y1), r2=25(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 57
LDI r2, 25
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
