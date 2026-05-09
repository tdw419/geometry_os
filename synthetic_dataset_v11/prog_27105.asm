; DESCRIPTION: Renders a red line between points (20, 102) and (187, 207).
; PLAN: r0=20(x1), r1=102(y1), r2=187(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 102
LDI r2, 187
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
