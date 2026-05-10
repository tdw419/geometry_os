; DESCRIPTION: Places a cyan line segment connecting (437, 183) to (317, 13).
; PLAN: r0=437(x1), r1=183(y1), r2=317(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 183
LDI r2, 317
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
