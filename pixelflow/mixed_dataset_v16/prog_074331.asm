; DESCRIPTION: Places a magenta line segment connecting (507, 255) to (368, 198).
; PLAN: r0=507(x1), r1=255(y1), r2=368(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 255
LDI r2, 368
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
