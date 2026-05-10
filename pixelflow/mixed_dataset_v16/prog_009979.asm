; DESCRIPTION: Places a red line segment connecting (346, 247) to (126, 89).
; PLAN: r0=346(x1), r1=247(y1), r2=126(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 247
LDI r2, 126
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
