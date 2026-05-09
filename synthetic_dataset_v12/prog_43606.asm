; DESCRIPTION: Renders a red line between points (313, 58) and (433, 252).
; PLAN: r0=313(x1), r1=58(y1), r2=433(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 58
LDI r2, 433
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
