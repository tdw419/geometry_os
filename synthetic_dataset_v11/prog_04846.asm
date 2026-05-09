; DESCRIPTION: Draws a yellow line from (67, 22) to (24, 42).
; PLAN: r0=67(x1), r1=22(y1), r2=24(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 22
LDI r2, 24
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
