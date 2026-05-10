; DESCRIPTION: Draws a green line from (231, 225) to (199, 196).
; PLAN: r0=231(x1), r1=225(y1), r2=199(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 225
LDI r2, 199
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
