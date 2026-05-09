; DESCRIPTION: Renders a green line between points (65, 23) and (140, 174).
; PLAN: r0=65(x1), r1=23(y1), r2=140(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 23
LDI r2, 140
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
