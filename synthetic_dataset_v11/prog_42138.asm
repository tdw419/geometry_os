; DESCRIPTION: Draws a green line from (123, 179) to (113, 100).
; PLAN: r0=123(x1), r1=179(y1), r2=113(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 179
LDI r2, 113
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
