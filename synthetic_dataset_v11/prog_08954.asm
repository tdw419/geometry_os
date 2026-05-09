; DESCRIPTION: Places a cyan line segment connecting (151, 236) to (85, 165).
; PLAN: r0=151(x1), r1=236(y1), r2=85(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 236
LDI r2, 85
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
