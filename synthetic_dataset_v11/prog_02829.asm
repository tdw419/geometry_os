; DESCRIPTION: Places a cyan line segment connecting (33, 61) to (164, 176).
; PLAN: r0=33(x1), r1=61(y1), r2=164(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 61
LDI r2, 164
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
