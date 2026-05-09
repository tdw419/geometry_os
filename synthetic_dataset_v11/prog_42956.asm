; DESCRIPTION: Places a cyan line segment connecting (244, 140) to (35, 182).
; PLAN: r0=244(x1), r1=140(y1), r2=35(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 35
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
