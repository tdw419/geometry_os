; DESCRIPTION: Places a green line segment connecting (488, 149) to (94, 226).
; PLAN: r0=488(x1), r1=149(y1), r2=94(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 149
LDI r2, 94
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
