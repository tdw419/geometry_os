; DESCRIPTION: Places a cyan line segment connecting (317, 207) to (38, 186).
; PLAN: r0=317(x1), r1=207(y1), r2=38(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 207
LDI r2, 38
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
