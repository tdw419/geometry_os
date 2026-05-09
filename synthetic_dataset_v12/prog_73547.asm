; DESCRIPTION: Renders a green line between points (383, 169) and (123, 167).
; PLAN: r0=383(x1), r1=169(y1), r2=123(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 169
LDI r2, 123
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
