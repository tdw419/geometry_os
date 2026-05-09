; DESCRIPTION: Draws a green line from (135, 247) to (184, 114).
; PLAN: r0=135(x1), r1=247(y1), r2=184(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 247
LDI r2, 184
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
