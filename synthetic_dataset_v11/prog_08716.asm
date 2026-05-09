; DESCRIPTION: Draws a red line from (45, 237) to (39, 118).
; PLAN: r0=45(x1), r1=237(y1), r2=39(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 237
LDI r2, 39
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
