; DESCRIPTION: Places a red line segment connecting (295, 222) to (447, 95).
; PLAN: r0=295(x1), r1=222(y1), r2=447(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 222
LDI r2, 447
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
