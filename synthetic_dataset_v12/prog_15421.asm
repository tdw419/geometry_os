; DESCRIPTION: Renders a cyan line between points (181, 227) and (350, 44).
; PLAN: r0=181(x1), r1=227(y1), r2=350(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 227
LDI r2, 350
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
