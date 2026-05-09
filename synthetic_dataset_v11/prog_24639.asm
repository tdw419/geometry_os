; DESCRIPTION: Renders a blue line between points (167, 204) and (239, 105).
; PLAN: r0=167(x1), r1=204(y1), r2=239(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 204
LDI r2, 239
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
