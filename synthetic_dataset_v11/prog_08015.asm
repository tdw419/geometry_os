; DESCRIPTION: Draws a green line from (160, 209) to (211, 145).
; PLAN: r0=160(x1), r1=209(y1), r2=211(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 209
LDI r2, 211
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
