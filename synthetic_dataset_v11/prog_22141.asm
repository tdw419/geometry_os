; DESCRIPTION: Places a cyan line segment connecting (73, 113) to (193, 53).
; PLAN: r0=73(x1), r1=113(y1), r2=193(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 113
LDI r2, 193
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
