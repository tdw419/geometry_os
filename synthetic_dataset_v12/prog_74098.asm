; DESCRIPTION: Renders a magenta line between points (503, 254) and (11, 241).
; PLAN: r0=503(x1), r1=254(y1), r2=11(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 254
LDI r2, 11
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
