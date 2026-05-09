; DESCRIPTION: Places a green line segment connecting (67, 196) to (16, 114).
; PLAN: r0=67(x1), r1=196(y1), r2=16(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 196
LDI r2, 16
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
