; DESCRIPTION: Places a cyan line segment connecting (237, 217) to (150, 230).
; PLAN: r0=237(x1), r1=217(y1), r2=150(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 217
LDI r2, 150
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
