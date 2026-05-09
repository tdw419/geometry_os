; DESCRIPTION: Draws a green line from (113, 63) to (38, 100).
; PLAN: r0=113(x1), r1=63(y1), r2=38(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 63
LDI r2, 38
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
