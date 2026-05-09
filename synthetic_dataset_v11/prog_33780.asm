; DESCRIPTION: Places a cyan line segment connecting (148, 41) to (164, 60).
; PLAN: r0=148(x1), r1=41(y1), r2=164(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 41
LDI r2, 164
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
