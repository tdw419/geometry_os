; DESCRIPTION: Renders a cyan line between points (283, 71) and (236, 123).
; PLAN: r0=283(x1), r1=71(y1), r2=236(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 71
LDI r2, 236
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
