; DESCRIPTION: Draws a white line from (403, 184) to (226, 95).
; PLAN: r0=403(x1), r1=184(y1), r2=226(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 184
LDI r2, 226
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
