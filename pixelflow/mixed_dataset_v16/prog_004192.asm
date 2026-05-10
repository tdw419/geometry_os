; DESCRIPTION: Draws a green line from (317, 76) to (182, 194).
; PLAN: r0=317(x1), r1=76(y1), r2=182(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 76
LDI r2, 182
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
