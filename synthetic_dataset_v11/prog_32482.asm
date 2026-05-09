; DESCRIPTION: Places a cyan line segment connecting (77, 168) to (155, 215).
; PLAN: r0=77(x1), r1=168(y1), r2=155(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 168
LDI r2, 155
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
