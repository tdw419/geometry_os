; DESCRIPTION: Places a cyan line segment connecting (125, 60) to (258, 212).
; PLAN: r0=125(x1), r1=60(y1), r2=258(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 60
LDI r2, 258
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
