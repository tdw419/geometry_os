; DESCRIPTION: Places a red line segment connecting (346, 248) to (138, 18).
; PLAN: r0=346(x1), r1=248(y1), r2=138(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 248
LDI r2, 138
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
