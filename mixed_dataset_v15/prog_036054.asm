; DESCRIPTION: Places a cyan line segment connecting (400, 102) to (65, 220).
; PLAN: r0=400(x1), r1=102(y1), r2=65(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 102
LDI r2, 65
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
