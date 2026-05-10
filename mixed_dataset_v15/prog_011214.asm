; DESCRIPTION: Places a cyan line segment connecting (70, 7) to (8, 73).
; PLAN: r0=70(x1), r1=7(y1), r2=8(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 7
LDI r2, 8
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
