; DESCRIPTION: Renders a cyan line between points (12, 147) and (302, 247).
; PLAN: r0=12(x1), r1=147(y1), r2=302(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 147
LDI r2, 302
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
