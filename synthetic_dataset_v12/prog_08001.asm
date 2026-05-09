; DESCRIPTION: Renders a orange line between points (236, 221) and (493, 180).
; PLAN: r0=236(x1), r1=221(y1), r2=493(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 221
LDI r2, 493
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
