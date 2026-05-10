; DESCRIPTION: Places a green line segment connecting (174, 161) to (467, 38).
; PLAN: r0=174(x1), r1=161(y1), r2=467(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 161
LDI r2, 467
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
