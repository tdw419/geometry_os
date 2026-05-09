; DESCRIPTION: Renders a cyan line between points (200, 249) and (210, 99).
; PLAN: r0=200(x1), r1=249(y1), r2=210(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 249
LDI r2, 210
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
