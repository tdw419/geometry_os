; DESCRIPTION: Renders a cyan line between points (66, 234) and (462, 4).
; PLAN: r0=66(x1), r1=234(y1), r2=462(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 234
LDI r2, 462
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
