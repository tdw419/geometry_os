; DESCRIPTION: Renders a cyan line between points (256, 169) and (451, 182).
; PLAN: r0=256(x1), r1=169(y1), r2=451(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 169
LDI r2, 451
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
