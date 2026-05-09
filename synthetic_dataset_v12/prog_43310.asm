; DESCRIPTION: Renders a red line between points (452, 66) and (304, 210).
; PLAN: r0=452(x1), r1=66(y1), r2=304(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 66
LDI r2, 304
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
