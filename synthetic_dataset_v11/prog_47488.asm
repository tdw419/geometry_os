; DESCRIPTION: Places a cyan line segment connecting (214, 80) to (172, 43).
; PLAN: r0=214(x1), r1=80(y1), r2=172(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 80
LDI r2, 172
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
