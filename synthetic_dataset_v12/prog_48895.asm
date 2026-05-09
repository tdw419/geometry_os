; DESCRIPTION: Draws a blue line from (6, 159) to (387, 190).
; PLAN: r0=6(x1), r1=159(y1), r2=387(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 159
LDI r2, 387
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
