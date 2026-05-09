; DESCRIPTION: Places a red line segment connecting (74, 243) to (27, 43).
; PLAN: r0=74(x1), r1=243(y1), r2=27(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 243
LDI r2, 27
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
