; DESCRIPTION: Draws a blue line from (12, 184) to (228, 96).
; PLAN: r0=12(x1), r1=184(y1), r2=228(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 184
LDI r2, 228
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
