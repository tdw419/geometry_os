; DESCRIPTION: Renders a red line between points (37, 166) and (473, 187).
; PLAN: r0=37(x1), r1=166(y1), r2=473(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 166
LDI r2, 473
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
