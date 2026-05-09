; DESCRIPTION: Places a cyan line segment connecting (120, 85) to (345, 189).
; PLAN: r0=120(x1), r1=85(y1), r2=345(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 85
LDI r2, 345
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
