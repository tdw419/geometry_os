; DESCRIPTION: Renders a green line between points (324, 155) and (401, 46).
; PLAN: r0=324(x1), r1=155(y1), r2=401(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 155
LDI r2, 401
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
