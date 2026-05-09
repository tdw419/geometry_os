; DESCRIPTION: Places a cyan line segment connecting (49, 204) to (406, 4).
; PLAN: r0=49(x1), r1=204(y1), r2=406(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 204
LDI r2, 406
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
