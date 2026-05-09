; DESCRIPTION: Places a cyan line segment connecting (135, 18) to (1, 68).
; PLAN: r0=135(x1), r1=18(y1), r2=1(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 18
LDI r2, 1
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
