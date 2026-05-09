; DESCRIPTION: Renders a cyan line between points (110, 241) and (140, 210).
; PLAN: r0=110(x1), r1=241(y1), r2=140(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 241
LDI r2, 140
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
