; DESCRIPTION: Renders a cyan line between points (240, 229) and (201, 167).
; PLAN: r0=240(x1), r1=229(y1), r2=201(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 229
LDI r2, 201
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
