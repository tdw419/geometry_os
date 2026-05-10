; DESCRIPTION: Renders a red line between points (183, 160) and (228, 26).
; PLAN: r0=183(x1), r1=160(y1), r2=228(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 160
LDI r2, 228
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
