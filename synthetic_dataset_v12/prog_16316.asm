; DESCRIPTION: Draws a blue line from (118, 143) to (394, 8).
; PLAN: r0=118(x1), r1=143(y1), r2=394(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 143
LDI r2, 394
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
