; DESCRIPTION: Places a red line segment connecting (228, 168) to (385, 219).
; PLAN: r0=228(x1), r1=168(y1), r2=385(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 168
LDI r2, 385
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
