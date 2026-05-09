; DESCRIPTION: Renders a cyan line between points (133, 9) and (220, 212).
; PLAN: r0=133(x1), r1=9(y1), r2=220(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 9
LDI r2, 220
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
