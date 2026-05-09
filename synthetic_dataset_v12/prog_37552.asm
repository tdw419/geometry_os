; DESCRIPTION: Renders a blue line between points (103, 205) and (426, 18).
; PLAN: r0=103(x1), r1=205(y1), r2=426(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 205
LDI r2, 426
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
