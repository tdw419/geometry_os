; DESCRIPTION: Renders a green line between points (45, 163) and (273, 236).
; PLAN: r0=45(x1), r1=163(y1), r2=273(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 163
LDI r2, 273
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
