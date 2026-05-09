; DESCRIPTION: Renders a orange line between points (401, 96) and (411, 48).
; PLAN: r0=401(x1), r1=96(y1), r2=411(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 96
LDI r2, 411
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
