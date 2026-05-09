; DESCRIPTION: Renders a magenta line between points (74, 223) and (214, 248).
; PLAN: r0=74(x1), r1=223(y1), r2=214(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 223
LDI r2, 214
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
