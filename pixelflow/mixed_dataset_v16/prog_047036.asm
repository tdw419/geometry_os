; DESCRIPTION: Draws a red line from (47, 214) to (138, 125).
; PLAN: r0=47(x1), r1=214(y1), r2=138(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 214
LDI r2, 138
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
