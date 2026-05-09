; DESCRIPTION: Places a cyan line segment connecting (468, 244) to (391, 160).
; PLAN: r0=468(x1), r1=244(y1), r2=391(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 244
LDI r2, 391
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
