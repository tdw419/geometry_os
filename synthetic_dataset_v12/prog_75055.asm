; DESCRIPTION: Places a cyan line segment connecting (198, 179) to (453, 13).
; PLAN: r0=198(x1), r1=179(y1), r2=453(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 179
LDI r2, 453
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
