; DESCRIPTION: Places a cyan line segment connecting (442, 185) to (205, 72).
; PLAN: r0=442(x1), r1=185(y1), r2=205(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 185
LDI r2, 205
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
