; DESCRIPTION: Places a cyan line segment connecting (92, 67) to (118, 175).
; PLAN: r0=92(x1), r1=67(y1), r2=118(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 67
LDI r2, 118
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
