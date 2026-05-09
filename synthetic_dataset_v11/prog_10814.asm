; DESCRIPTION: Places a cyan line segment connecting (106, 69) to (219, 2).
; PLAN: r0=106(x1), r1=69(y1), r2=219(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 69
LDI r2, 219
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
