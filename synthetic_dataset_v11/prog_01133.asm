; DESCRIPTION: Places a cyan line segment connecting (29, 185) to (135, 73).
; PLAN: r0=29(x1), r1=185(y1), r2=135(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 185
LDI r2, 135
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
