; DESCRIPTION: Renders a magenta line between points (420, 59) and (304, 123).
; PLAN: r0=420(x1), r1=59(y1), r2=304(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 59
LDI r2, 304
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
