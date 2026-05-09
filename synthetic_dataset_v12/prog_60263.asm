; DESCRIPTION: Places a cyan line segment connecting (317, 93) to (297, 178).
; PLAN: r0=317(x1), r1=93(y1), r2=297(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 93
LDI r2, 297
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
