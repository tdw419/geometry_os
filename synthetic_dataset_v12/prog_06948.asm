; DESCRIPTION: Renders a green line between points (191, 204) and (237, 184).
; PLAN: r0=191(x1), r1=204(y1), r2=237(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 204
LDI r2, 237
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
