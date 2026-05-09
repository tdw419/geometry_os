; DESCRIPTION: Places a red line segment connecting (205, 243) to (383, 161).
; PLAN: r0=205(x1), r1=243(y1), r2=383(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 243
LDI r2, 383
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
