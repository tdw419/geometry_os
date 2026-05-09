; DESCRIPTION: Draws a green line from (177, 8) to (223, 180).
; PLAN: r0=177(x1), r1=8(y1), r2=223(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 8
LDI r2, 223
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
