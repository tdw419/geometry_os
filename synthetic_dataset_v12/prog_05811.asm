; DESCRIPTION: Places a cyan line segment connecting (481, 185) to (143, 69).
; PLAN: r0=481(x1), r1=185(y1), r2=143(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 185
LDI r2, 143
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
