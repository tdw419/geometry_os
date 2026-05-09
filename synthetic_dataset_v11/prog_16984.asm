; DESCRIPTION: Places a cyan line segment connecting (223, 115) to (38, 31).
; PLAN: r0=223(x1), r1=115(y1), r2=38(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 115
LDI r2, 38
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
