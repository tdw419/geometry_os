; DESCRIPTION: Renders a green line between points (97, 33) and (82, 203).
; PLAN: r0=97(x1), r1=33(y1), r2=82(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 33
LDI r2, 82
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
