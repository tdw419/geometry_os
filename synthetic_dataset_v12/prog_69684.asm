; DESCRIPTION: Places a red line segment connecting (175, 221) to (338, 33).
; PLAN: r0=175(x1), r1=221(y1), r2=338(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 221
LDI r2, 338
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
