; DESCRIPTION: Places a cyan line segment connecting (109, 35) to (4, 222).
; PLAN: r0=109(x1), r1=35(y1), r2=4(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 35
LDI r2, 4
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
