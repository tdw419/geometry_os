; DESCRIPTION: Draws a red line from (220, 148) to (206, 46).
; PLAN: r0=220(x1), r1=148(y1), r2=206(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 148
LDI r2, 206
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
