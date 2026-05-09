; DESCRIPTION: Places a red line segment connecting (452, 173) to (292, 27).
; PLAN: r0=452(x1), r1=173(y1), r2=292(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 173
LDI r2, 292
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
