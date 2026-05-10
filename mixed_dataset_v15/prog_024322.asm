; DESCRIPTION: Draws a green line from (205, 236) to (89, 50).
; PLAN: r0=205(x1), r1=236(y1), r2=89(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 236
LDI r2, 89
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
