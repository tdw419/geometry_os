; DESCRIPTION: Draws a red line from (355, 110) to (173, 125).
; PLAN: r0=355(x1), r1=110(y1), r2=173(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 110
LDI r2, 173
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
