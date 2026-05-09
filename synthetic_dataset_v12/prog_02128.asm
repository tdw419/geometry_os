; DESCRIPTION: Renders a red line between points (380, 18) and (150, 43).
; PLAN: r0=380(x1), r1=18(y1), r2=150(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 18
LDI r2, 150
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
