; DESCRIPTION: Places a cyan line segment connecting (163, 8) to (96, 134).
; PLAN: r0=163(x1), r1=8(y1), r2=96(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 8
LDI r2, 96
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
