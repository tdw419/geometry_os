; DESCRIPTION: Renders a green line between points (195, 19) and (200, 236).
; PLAN: r0=195(x1), r1=19(y1), r2=200(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 19
LDI r2, 200
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
