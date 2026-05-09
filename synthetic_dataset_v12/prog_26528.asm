; DESCRIPTION: Renders a cyan line between points (319, 172) and (234, 162).
; PLAN: r0=319(x1), r1=172(y1), r2=234(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 172
LDI r2, 234
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
