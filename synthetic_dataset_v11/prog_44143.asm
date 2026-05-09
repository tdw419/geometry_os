; DESCRIPTION: Draws a green line from (64, 131) to (79, 191).
; PLAN: r0=64(x1), r1=131(y1), r2=79(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 131
LDI r2, 79
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
