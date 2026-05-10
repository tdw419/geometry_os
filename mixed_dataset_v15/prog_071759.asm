; DESCRIPTION: Places a cyan line segment connecting (145, 61) to (442, 220).
; PLAN: r0=145(x1), r1=61(y1), r2=442(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 61
LDI r2, 442
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
