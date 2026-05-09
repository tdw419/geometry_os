; DESCRIPTION: Renders a green line between points (29, 197) and (409, 89).
; PLAN: r0=29(x1), r1=197(y1), r2=409(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 197
LDI r2, 409
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
