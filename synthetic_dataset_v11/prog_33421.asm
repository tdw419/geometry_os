; DESCRIPTION: Renders a green line between points (39, 72) and (230, 159).
; PLAN: r0=39(x1), r1=72(y1), r2=230(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 72
LDI r2, 230
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
