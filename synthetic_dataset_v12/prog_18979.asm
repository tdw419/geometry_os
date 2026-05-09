; DESCRIPTION: Places a cyan line segment connecting (161, 172) to (255, 62).
; PLAN: r0=161(x1), r1=172(y1), r2=255(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 172
LDI r2, 255
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
