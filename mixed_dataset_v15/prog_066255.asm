; DESCRIPTION: Places a red line segment connecting (228, 247) to (107, 165).
; PLAN: r0=228(x1), r1=247(y1), r2=107(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 247
LDI r2, 107
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
