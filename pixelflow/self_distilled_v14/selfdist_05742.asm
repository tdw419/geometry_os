; DESCRIPTION: Renders a cyan line segment connecting (155, 181) to (218, 68).
; PLAN: r0=155(x1), r1=181(y1), r2=218(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 181
LDI r2, 218
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
