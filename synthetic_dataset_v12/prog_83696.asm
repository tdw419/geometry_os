; DESCRIPTION: Renders a green line between points (212, 84) and (320, 51).
; PLAN: r0=212(x1), r1=84(y1), r2=320(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 84
LDI r2, 320
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
