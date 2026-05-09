; DESCRIPTION: Places a red line segment connecting (123, 117) to (113, 212).
; PLAN: r0=123(x1), r1=117(y1), r2=113(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 117
LDI r2, 113
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
