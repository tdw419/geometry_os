; DESCRIPTION: Draws a yellow line from (67, 20) to (154, 161).
; PLAN: r0=67(x1), r1=20(y1), r2=154(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 20
LDI r2, 154
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
