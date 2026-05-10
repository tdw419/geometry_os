; DESCRIPTION: Renders a green line between points (272, 163) and (288, 21).
; PLAN: r0=272(x1), r1=163(y1), r2=288(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 163
LDI r2, 288
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
