; DESCRIPTION: Renders a orange line between points (182, 238) and (256, 209).
; PLAN: r0=182(x1), r1=238(y1), r2=256(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 238
LDI r2, 256
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
