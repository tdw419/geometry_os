; DESCRIPTION: Draws a red line from (29, 23) to (122, 48).
; PLAN: r0=29(x1), r1=23(y1), r2=122(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 23
LDI r2, 122
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
