; DESCRIPTION: Places a cyan line segment connecting (343, 164) to (345, 244).
; PLAN: r0=343(x1), r1=164(y1), r2=345(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 164
LDI r2, 345
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
