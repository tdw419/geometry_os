; DESCRIPTION: Places a cyan line segment connecting (293, 53) to (430, 199).
; PLAN: r0=293(x1), r1=53(y1), r2=430(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 53
LDI r2, 430
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
