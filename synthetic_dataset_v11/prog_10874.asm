; DESCRIPTION: Draws a green line from (195, 102) to (131, 5).
; PLAN: r0=195(x1), r1=102(y1), r2=131(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 102
LDI r2, 131
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
