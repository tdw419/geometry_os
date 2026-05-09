; DESCRIPTION: Places a cyan line segment connecting (252, 124) to (492, 168).
; PLAN: r0=252(x1), r1=124(y1), r2=492(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 124
LDI r2, 492
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
