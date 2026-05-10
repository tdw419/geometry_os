; DESCRIPTION: Places a cyan line segment connecting (73, 189) to (329, 74).
; PLAN: r0=73(x1), r1=189(y1), r2=329(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 189
LDI r2, 329
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
