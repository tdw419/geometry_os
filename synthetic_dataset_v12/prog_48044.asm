; DESCRIPTION: Places a cyan line segment connecting (229, 127) to (285, 76).
; PLAN: r0=229(x1), r1=127(y1), r2=285(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 127
LDI r2, 285
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
