; DESCRIPTION: Places a cyan line segment connecting (423, 103) to (76, 40).
; PLAN: r0=423(x1), r1=103(y1), r2=76(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 103
LDI r2, 76
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
