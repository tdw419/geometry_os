; DESCRIPTION: Renders a white line between points (243, 166) and (443, 74).
; PLAN: r0=243(x1), r1=166(y1), r2=443(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 166
LDI r2, 443
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
