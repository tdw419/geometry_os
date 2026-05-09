; DESCRIPTION: Places a white line segment connecting (161, 195) to (477, 187).
; PLAN: r0=161(x1), r1=195(y1), r2=477(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 195
LDI r2, 477
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
