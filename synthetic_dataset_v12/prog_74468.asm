; DESCRIPTION: Places a cyan line segment connecting (453, 230) to (72, 162).
; PLAN: r0=453(x1), r1=230(y1), r2=72(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 230
LDI r2, 72
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
