; DESCRIPTION: Draws a red line from (135, 95) to (111, 125).
; PLAN: r0=135(x1), r1=95(y1), r2=111(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 95
LDI r2, 111
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
