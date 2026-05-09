; DESCRIPTION: Places a cyan line segment connecting (23, 180) to (229, 161).
; PLAN: r0=23(x1), r1=180(y1), r2=229(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 180
LDI r2, 229
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
