; DESCRIPTION: Renders a cyan line between points (314, 188) and (70, 168).
; PLAN: r0=314(x1), r1=188(y1), r2=70(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 188
LDI r2, 70
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
