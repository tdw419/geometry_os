; DESCRIPTION: Renders a green line between points (237, 176) and (157, 125).
; PLAN: r0=237(x1), r1=176(y1), r2=157(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 176
LDI r2, 157
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
