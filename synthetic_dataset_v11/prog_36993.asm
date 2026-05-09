; DESCRIPTION: Renders a cyan line between points (191, 218) and (43, 44).
; PLAN: r0=191(x1), r1=218(y1), r2=43(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 218
LDI r2, 43
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
