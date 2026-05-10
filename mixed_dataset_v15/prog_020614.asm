; DESCRIPTION: Places a cyan line segment connecting (331, 221) to (350, 109).
; PLAN: r0=331(x1), r1=221(y1), r2=350(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 221
LDI r2, 350
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
