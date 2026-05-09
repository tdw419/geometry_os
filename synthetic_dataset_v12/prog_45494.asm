; DESCRIPTION: Places a green line segment connecting (108, 115) to (295, 128).
; PLAN: r0=108(x1), r1=115(y1), r2=295(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 115
LDI r2, 295
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
