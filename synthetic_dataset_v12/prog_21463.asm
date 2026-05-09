; DESCRIPTION: Renders a green line between points (414, 195) and (292, 168).
; PLAN: r0=414(x1), r1=195(y1), r2=292(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 195
LDI r2, 292
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
