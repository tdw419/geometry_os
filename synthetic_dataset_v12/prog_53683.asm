; DESCRIPTION: Renders a blue line between points (125, 215) and (272, 50).
; PLAN: r0=125(x1), r1=215(y1), r2=272(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 215
LDI r2, 272
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
