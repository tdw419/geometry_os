; DESCRIPTION: Renders a red line between points (283, 187) and (433, 30).
; PLAN: r0=283(x1), r1=187(y1), r2=433(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 187
LDI r2, 433
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
