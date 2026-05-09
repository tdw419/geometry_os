; DESCRIPTION: Draws a blue line from (280, 120) to (297, 190).
; PLAN: r0=280(x1), r1=120(y1), r2=297(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 120
LDI r2, 297
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
