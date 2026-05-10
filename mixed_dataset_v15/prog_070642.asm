; DESCRIPTION: Draws a red line from (449, 2) to (195, 219).
; PLAN: r0=449(x1), r1=2(y1), r2=195(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 2
LDI r2, 195
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
