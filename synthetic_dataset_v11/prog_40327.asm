; DESCRIPTION: Renders a cyan line between points (234, 237) and (227, 99).
; PLAN: r0=234(x1), r1=237(y1), r2=227(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 237
LDI r2, 227
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
