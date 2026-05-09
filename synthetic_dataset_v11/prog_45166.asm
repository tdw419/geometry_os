; DESCRIPTION: Renders a green line between points (145, 197) and (24, 75).
; PLAN: r0=145(x1), r1=197(y1), r2=24(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 197
LDI r2, 24
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
