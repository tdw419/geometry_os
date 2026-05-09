; DESCRIPTION: Draws a white line from (108, 65) to (170, 246).
; PLAN: r0=108(x1), r1=65(y1), r2=170(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 170
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
