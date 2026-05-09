; DESCRIPTION: Draws a blue line from (315, 38) to (168, 190).
; PLAN: r0=315(x1), r1=38(y1), r2=168(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 38
LDI r2, 168
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
