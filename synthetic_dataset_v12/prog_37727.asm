; DESCRIPTION: Draws a blue line from (83, 16) to (31, 143).
; PLAN: r0=83(x1), r1=16(y1), r2=31(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 16
LDI r2, 31
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
