; DESCRIPTION: Renders a orange line between points (322, 228) and (72, 162).
; PLAN: r0=322(x1), r1=228(y1), r2=72(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 228
LDI r2, 72
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
