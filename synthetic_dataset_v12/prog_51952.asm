; DESCRIPTION: Places a cyan line segment connecting (80, 20) to (237, 51).
; PLAN: r0=80(x1), r1=20(y1), r2=237(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 20
LDI r2, 237
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
