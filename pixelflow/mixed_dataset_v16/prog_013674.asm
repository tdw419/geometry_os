; DESCRIPTION: Places a red line segment connecting (223, 243) to (450, 125).
; PLAN: r0=223(x1), r1=243(y1), r2=450(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 243
LDI r2, 450
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
