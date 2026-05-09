; DESCRIPTION: Renders a blue line between points (272, 27) and (347, 172).
; PLAN: r0=272(x1), r1=27(y1), r2=347(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 27
LDI r2, 347
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
