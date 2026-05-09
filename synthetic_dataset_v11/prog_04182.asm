; DESCRIPTION: Places a cyan line segment connecting (43, 231) to (68, 141).
; PLAN: r0=43(x1), r1=231(y1), r2=68(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 231
LDI r2, 68
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
