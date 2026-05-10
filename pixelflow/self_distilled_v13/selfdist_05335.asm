; DESCRIPTION: Draws a yellow line from (256, 48) to (67, 61).
; PLAN: r0=256(x1), r1=48(y1), r2=67(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 48
LDI r2, 67
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
