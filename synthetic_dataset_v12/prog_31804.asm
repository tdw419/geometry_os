; DESCRIPTION: Draws a green line from (215, 223) to (43, 145).
; PLAN: r0=215(x1), r1=223(y1), r2=43(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 223
LDI r2, 43
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
