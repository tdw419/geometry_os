; DESCRIPTION: Renders a red line between points (70, 69) and (452, 28).
; PLAN: r0=70(x1), r1=69(y1), r2=452(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 69
LDI r2, 452
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
