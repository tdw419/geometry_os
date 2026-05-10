; DESCRIPTION: Draws a green line from (131, 36) to (199, 83).
; PLAN: r0=131(x1), r1=36(y1), r2=199(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 36
LDI r2, 199
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
