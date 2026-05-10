; DESCRIPTION: Draws a yellow line from (16, 154) to (67, 254).
; PLAN: r0=16(x1), r1=154(y1), r2=67(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 154
LDI r2, 67
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
