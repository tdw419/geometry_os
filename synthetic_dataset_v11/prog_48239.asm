; DESCRIPTION: Renders a red line between points (46, 28) and (18, 83).
; PLAN: r0=46(x1), r1=28(y1), r2=18(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 28
LDI r2, 18
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
