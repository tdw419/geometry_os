; DESCRIPTION: Places a red line segment connecting (44, 154) to (81, 125).
; PLAN: r0=44(x1), r1=154(y1), r2=81(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 154
LDI r2, 81
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
