; DESCRIPTION: Places a cyan line segment connecting (345, 41) to (140, 128).
; PLAN: r0=345(x1), r1=41(y1), r2=140(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 41
LDI r2, 140
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
