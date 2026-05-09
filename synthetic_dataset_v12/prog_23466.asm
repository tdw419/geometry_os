; DESCRIPTION: Renders a green line between points (508, 236) and (0, 209).
; PLAN: r0=508(x1), r1=236(y1), r2=0(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 236
LDI r2, 0
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
