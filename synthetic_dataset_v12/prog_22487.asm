; DESCRIPTION: Renders a green line between points (1, 195) and (388, 161).
; PLAN: r0=1(x1), r1=195(y1), r2=388(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 195
LDI r2, 388
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
