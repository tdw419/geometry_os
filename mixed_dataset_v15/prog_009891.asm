; DESCRIPTION: Draws a green line from (11, 72) to (134, 186).
; PLAN: r0=11(x1), r1=72(y1), r2=134(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 72
LDI r2, 134
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
