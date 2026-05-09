; DESCRIPTION: Renders a blue line between points (196, 34) and (380, 113).
; PLAN: r0=196(x1), r1=34(y1), r2=380(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 34
LDI r2, 380
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
