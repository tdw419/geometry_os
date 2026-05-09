; DESCRIPTION: Places a green line segment connecting (433, 41) to (171, 108).
; PLAN: r0=433(x1), r1=41(y1), r2=171(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 41
LDI r2, 171
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
