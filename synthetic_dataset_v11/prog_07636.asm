; DESCRIPTION: Places a red line segment connecting (138, 239) to (43, 171).
; PLAN: r0=138(x1), r1=239(y1), r2=43(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 239
LDI r2, 43
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
