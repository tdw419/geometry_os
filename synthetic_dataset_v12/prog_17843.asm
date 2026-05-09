; DESCRIPTION: Places a cyan line segment connecting (506, 86) to (135, 216).
; PLAN: r0=506(x1), r1=86(y1), r2=135(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 86
LDI r2, 135
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
