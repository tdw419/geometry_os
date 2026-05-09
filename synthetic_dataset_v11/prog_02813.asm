; DESCRIPTION: Places a cyan line segment connecting (191, 60) to (0, 153).
; PLAN: r0=191(x1), r1=60(y1), r2=0(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 60
LDI r2, 0
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
