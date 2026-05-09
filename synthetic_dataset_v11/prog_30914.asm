; DESCRIPTION: Places a red line segment connecting (183, 228) to (138, 82).
; PLAN: r0=183(x1), r1=228(y1), r2=138(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 228
LDI r2, 138
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
