; DESCRIPTION: Draws a green line from (10, 164) to (135, 68).
; PLAN: r0=10(x1), r1=164(y1), r2=135(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 164
LDI r2, 135
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
