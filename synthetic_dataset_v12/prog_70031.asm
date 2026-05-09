; DESCRIPTION: Places a cyan line segment connecting (279, 216) to (503, 226).
; PLAN: r0=279(x1), r1=216(y1), r2=503(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 216
LDI r2, 503
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
