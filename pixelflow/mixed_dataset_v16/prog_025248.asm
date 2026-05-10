; DESCRIPTION: Draws a yellow line from (403, 42) to (169, 159).
; PLAN: r0=403(x1), r1=42(y1), r2=169(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 42
LDI r2, 169
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
