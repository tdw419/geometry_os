; DESCRIPTION: Draws a yellow line from (329, 45) to (317, 194).
; PLAN: r0=329(x1), r1=45(y1), r2=317(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 45
LDI r2, 317
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
