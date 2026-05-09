; DESCRIPTION: Draws a green line from (342, 135) to (48, 203).
; PLAN: r0=342(x1), r1=135(y1), r2=48(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 135
LDI r2, 48
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
