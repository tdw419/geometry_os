; DESCRIPTION: Renders a white line between points (443, 88) and (445, 218).
; PLAN: r0=443(x1), r1=88(y1), r2=445(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 88
LDI r2, 445
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
