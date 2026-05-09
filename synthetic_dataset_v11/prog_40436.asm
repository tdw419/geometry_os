; DESCRIPTION: Renders a red line between points (211, 47) and (180, 98).
; PLAN: r0=211(x1), r1=47(y1), r2=180(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 47
LDI r2, 180
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
