; DESCRIPTION: Places a cyan line segment connecting (115, 69) to (66, 121).
; PLAN: r0=115(x1), r1=69(y1), r2=66(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 69
LDI r2, 66
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
