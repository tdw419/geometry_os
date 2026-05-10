; DESCRIPTION: Renders a blue line between points (380, 205) and (101, 252).
; PLAN: r0=380(x1), r1=205(y1), r2=101(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 205
LDI r2, 101
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
