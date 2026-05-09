; DESCRIPTION: Draws a green line from (334, 11) to (67, 64).
; PLAN: r0=334(x1), r1=11(y1), r2=67(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 11
LDI r2, 67
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
