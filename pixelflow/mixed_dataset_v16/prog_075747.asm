; DESCRIPTION: Renders a red line between points (445, 210) and (470, 141).
; PLAN: r0=445(x1), r1=210(y1), r2=470(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 210
LDI r2, 470
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
