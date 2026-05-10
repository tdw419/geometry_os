; DESCRIPTION: Places a cyan line segment connecting (329, 70) to (472, 148).
; PLAN: r0=329(x1), r1=70(y1), r2=472(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 70
LDI r2, 472
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
