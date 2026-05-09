; DESCRIPTION: Places a cyan line segment connecting (61, 151) to (157, 100).
; PLAN: r0=61(x1), r1=151(y1), r2=157(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 151
LDI r2, 157
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
