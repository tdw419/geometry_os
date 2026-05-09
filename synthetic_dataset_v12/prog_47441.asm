; DESCRIPTION: Places a cyan line segment connecting (1, 102) to (270, 182).
; PLAN: r0=1(x1), r1=102(y1), r2=270(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 102
LDI r2, 270
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
