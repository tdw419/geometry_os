; DESCRIPTION: Places a cyan line segment connecting (73, 229) to (442, 115).
; PLAN: r0=73(x1), r1=229(y1), r2=442(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 229
LDI r2, 442
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
