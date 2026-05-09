; DESCRIPTION: Renders a magenta line between points (209, 241) and (95, 187).
; PLAN: r0=209(x1), r1=241(y1), r2=95(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 241
LDI r2, 95
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
