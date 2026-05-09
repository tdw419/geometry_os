; DESCRIPTION: Places a cyan line segment connecting (230, 185) to (115, 182).
; PLAN: r0=230(x1), r1=185(y1), r2=115(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 185
LDI r2, 115
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
