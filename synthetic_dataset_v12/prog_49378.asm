; DESCRIPTION: Places a cyan line segment connecting (377, 176) to (211, 60).
; PLAN: r0=377(x1), r1=176(y1), r2=211(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 176
LDI r2, 211
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
