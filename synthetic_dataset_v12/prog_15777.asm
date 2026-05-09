; DESCRIPTION: Renders a magenta line between points (296, 165) and (189, 182).
; PLAN: r0=296(x1), r1=165(y1), r2=189(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 165
LDI r2, 189
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
