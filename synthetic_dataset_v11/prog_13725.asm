; DESCRIPTION: Renders a cyan line between points (129, 128) and (200, 159).
; PLAN: r0=129(x1), r1=128(y1), r2=200(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 128
LDI r2, 200
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
