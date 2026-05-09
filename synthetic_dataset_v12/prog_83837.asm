; DESCRIPTION: Draws a green line from (38, 194) to (212, 45).
; PLAN: r0=38(x1), r1=194(y1), r2=212(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 194
LDI r2, 212
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
