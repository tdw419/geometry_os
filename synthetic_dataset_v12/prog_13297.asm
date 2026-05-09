; DESCRIPTION: Draws a red line from (88, 196) to (346, 98).
; PLAN: r0=88(x1), r1=196(y1), r2=346(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 196
LDI r2, 346
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
