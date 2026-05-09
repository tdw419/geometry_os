; DESCRIPTION: Places a cyan line segment connecting (358, 185) to (72, 87).
; PLAN: r0=358(x1), r1=185(y1), r2=72(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 185
LDI r2, 72
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
