; DESCRIPTION: Renders a magenta line between points (248, 135) and (103, 210).
; PLAN: r0=248(x1), r1=135(y1), r2=103(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 135
LDI r2, 103
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
