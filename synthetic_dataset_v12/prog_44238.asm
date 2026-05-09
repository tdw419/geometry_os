; DESCRIPTION: Places a cyan line segment connecting (453, 81) to (504, 141).
; PLAN: r0=453(x1), r1=81(y1), r2=504(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 81
LDI r2, 504
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
