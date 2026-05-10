; DESCRIPTION: Places a cyan line segment connecting (345, 5) to (188, 189).
; PLAN: r0=345(x1), r1=5(y1), r2=188(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 5
LDI r2, 188
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
