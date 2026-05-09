; DESCRIPTION: Renders a red line between points (215, 250) and (198, 194).
; PLAN: r0=215(x1), r1=250(y1), r2=198(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 250
LDI r2, 198
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
