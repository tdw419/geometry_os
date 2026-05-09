; DESCRIPTION: Renders a magenta line between points (327, 219) and (288, 194).
; PLAN: r0=327(x1), r1=219(y1), r2=288(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 219
LDI r2, 288
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
