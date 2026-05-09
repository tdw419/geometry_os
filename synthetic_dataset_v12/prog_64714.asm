; DESCRIPTION: Renders a green line between points (144, 29) and (324, 193).
; PLAN: r0=144(x1), r1=29(y1), r2=324(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 29
LDI r2, 324
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
