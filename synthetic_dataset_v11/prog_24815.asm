; DESCRIPTION: Places a cyan line segment connecting (233, 196) to (67, 88).
; PLAN: r0=233(x1), r1=196(y1), r2=67(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 196
LDI r2, 67
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
