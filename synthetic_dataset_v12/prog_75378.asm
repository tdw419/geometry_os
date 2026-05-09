; DESCRIPTION: Renders a green line between points (272, 125) and (12, 43).
; PLAN: r0=272(x1), r1=125(y1), r2=12(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 125
LDI r2, 12
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
