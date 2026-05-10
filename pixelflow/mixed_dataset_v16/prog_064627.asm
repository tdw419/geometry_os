; DESCRIPTION: Renders a magenta line between points (502, 77) and (240, 67).
; PLAN: r0=502(x1), r1=77(y1), r2=240(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 77
LDI r2, 240
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
