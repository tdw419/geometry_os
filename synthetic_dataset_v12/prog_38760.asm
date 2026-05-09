; DESCRIPTION: Places a cyan line segment connecting (476, 159) to (63, 243).
; PLAN: r0=476(x1), r1=159(y1), r2=63(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 159
LDI r2, 63
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
