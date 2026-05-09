; DESCRIPTION: Draws a green line from (54, 164) to (204, 135).
; PLAN: r0=54(x1), r1=164(y1), r2=204(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 164
LDI r2, 204
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
