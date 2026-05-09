; DESCRIPTION: Draws a red line from (446, 148) to (195, 38).
; PLAN: r0=446(x1), r1=148(y1), r2=195(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 148
LDI r2, 195
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
