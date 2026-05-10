; DESCRIPTION: Places a cyan line segment connecting (452, 161) to (303, 131).
; PLAN: r0=452(x1), r1=161(y1), r2=303(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 161
LDI r2, 303
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
