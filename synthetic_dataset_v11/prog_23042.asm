; DESCRIPTION: Places a cyan line segment connecting (208, 196) to (22, 175).
; PLAN: r0=208(x1), r1=196(y1), r2=22(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 196
LDI r2, 22
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
