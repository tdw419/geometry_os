; DESCRIPTION: Draws a green line from (199, 144) to (122, 37).
; PLAN: r0=199(x1), r1=144(y1), r2=122(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 144
LDI r2, 122
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
