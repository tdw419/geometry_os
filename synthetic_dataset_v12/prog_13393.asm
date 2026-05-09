; DESCRIPTION: Renders a red line between points (383, 16) and (485, 196).
; PLAN: r0=383(x1), r1=16(y1), r2=485(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 16
LDI r2, 485
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
