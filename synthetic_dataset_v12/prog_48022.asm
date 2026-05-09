; DESCRIPTION: Places a green line segment connecting (450, 221) to (439, 131).
; PLAN: r0=450(x1), r1=221(y1), r2=439(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 221
LDI r2, 439
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
