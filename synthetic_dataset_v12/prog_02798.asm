; DESCRIPTION: Draws a red line from (255, 171) to (215, 112).
; PLAN: r0=255(x1), r1=171(y1), r2=215(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 171
LDI r2, 215
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
