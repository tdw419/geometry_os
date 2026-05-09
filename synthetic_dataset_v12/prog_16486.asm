; DESCRIPTION: Draws a green line from (171, 37) to (334, 218).
; PLAN: r0=171(x1), r1=37(y1), r2=334(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 37
LDI r2, 334
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
