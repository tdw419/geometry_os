; DESCRIPTION: Places a cyan line segment connecting (135, 251) to (207, 10).
; PLAN: r0=135(x1), r1=251(y1), r2=207(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 251
LDI r2, 207
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
