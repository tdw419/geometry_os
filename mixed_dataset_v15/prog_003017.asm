; DESCRIPTION: Draws a magenta line from (87, 73) to (383, 123).
; PLAN: r0=87(x1), r1=73(y1), r2=383(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 73
LDI r2, 383
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
