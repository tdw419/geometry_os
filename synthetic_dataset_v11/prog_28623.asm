; DESCRIPTION: Draws a yellow line from (49, 69) to (225, 61).
; PLAN: r0=49(x1), r1=69(y1), r2=225(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 69
LDI r2, 225
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
