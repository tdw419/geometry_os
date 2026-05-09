; DESCRIPTION: Draws a green line from (199, 131) to (13, 164).
; PLAN: r0=199(x1), r1=131(y1), r2=13(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 131
LDI r2, 13
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
