; DESCRIPTION: Places a cyan line segment connecting (125, 2) to (96, 67).
; PLAN: r0=125(x1), r1=2(y1), r2=96(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 2
LDI r2, 96
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
