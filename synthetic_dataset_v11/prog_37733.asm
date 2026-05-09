; DESCRIPTION: Draws a green line from (94, 67) to (96, 204).
; PLAN: r0=94(x1), r1=67(y1), r2=96(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 67
LDI r2, 96
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
