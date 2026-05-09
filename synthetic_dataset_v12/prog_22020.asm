; DESCRIPTION: Places a green line segment connecting (328, 116) to (141, 68).
; PLAN: r0=328(x1), r1=116(y1), r2=141(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 116
LDI r2, 141
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
