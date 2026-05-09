; DESCRIPTION: Renders a green line between points (94, 79) and (252, 103).
; PLAN: r0=94(x1), r1=79(y1), r2=252(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 79
LDI r2, 252
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
