; DESCRIPTION: Renders a red line between points (243, 26) and (80, 174).
; PLAN: r0=243(x1), r1=26(y1), r2=80(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 26
LDI r2, 80
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
