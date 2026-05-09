; DESCRIPTION: Places a cyan line segment connecting (36, 221) to (89, 168).
; PLAN: r0=36(x1), r1=221(y1), r2=89(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 221
LDI r2, 89
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
