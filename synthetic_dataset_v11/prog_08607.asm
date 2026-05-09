; DESCRIPTION: Draws a green line from (89, 215) to (106, 204).
; PLAN: r0=89(x1), r1=215(y1), r2=106(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 215
LDI r2, 106
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
