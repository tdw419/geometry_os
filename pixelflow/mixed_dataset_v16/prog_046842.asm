; DESCRIPTION: Places a cyan line segment connecting (237, 150) to (430, 251).
; PLAN: r0=237(x1), r1=150(y1), r2=430(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 150
LDI r2, 430
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
