; DESCRIPTION: Places a green line segment connecting (398, 41) to (337, 167).
; PLAN: r0=398(x1), r1=41(y1), r2=337(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 41
LDI r2, 337
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
