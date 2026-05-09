; DESCRIPTION: Renders a blue line between points (167, 32) and (90, 69).
; PLAN: r0=167(x1), r1=32(y1), r2=90(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 32
LDI r2, 90
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
