; DESCRIPTION: Renders a red line between points (281, 205) and (389, 148).
; PLAN: r0=281(x1), r1=205(y1), r2=389(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 205
LDI r2, 389
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
