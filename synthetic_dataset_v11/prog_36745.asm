; DESCRIPTION: Places a cyan line segment connecting (172, 72) to (161, 202).
; PLAN: r0=172(x1), r1=72(y1), r2=161(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 72
LDI r2, 161
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
