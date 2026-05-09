; DESCRIPTION: Places a cyan line segment connecting (87, 181) to (333, 158).
; PLAN: r0=87(x1), r1=181(y1), r2=333(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 181
LDI r2, 333
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
