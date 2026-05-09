; DESCRIPTION: Draws a blue line from (442, 11) to (166, 190).
; PLAN: r0=442(x1), r1=11(y1), r2=166(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 11
LDI r2, 166
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
