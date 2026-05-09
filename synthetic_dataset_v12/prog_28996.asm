; DESCRIPTION: Renders a magenta line between points (241, 0) and (16, 98).
; PLAN: r0=241(x1), r1=0(y1), r2=16(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 0
LDI r2, 16
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
