; DESCRIPTION: Places a cyan line segment connecting (215, 106) to (172, 85).
; PLAN: r0=215(x1), r1=106(y1), r2=172(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 106
LDI r2, 172
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
