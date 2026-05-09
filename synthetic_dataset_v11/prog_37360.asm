; DESCRIPTION: Places a cyan line segment connecting (157, 163) to (217, 161).
; PLAN: r0=157(x1), r1=163(y1), r2=217(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 163
LDI r2, 217
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
