; DESCRIPTION: Renders a green line between points (56, 149) and (166, 202).
; PLAN: r0=56(x1), r1=149(y1), r2=166(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 149
LDI r2, 166
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
