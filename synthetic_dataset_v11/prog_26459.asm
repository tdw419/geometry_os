; DESCRIPTION: Renders a red line between points (207, 187) and (152, 118).
; PLAN: r0=207(x1), r1=187(y1), r2=152(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 187
LDI r2, 152
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
