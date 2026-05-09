; DESCRIPTION: Renders a magenta line between points (412, 41) and (241, 215).
; PLAN: r0=412(x1), r1=41(y1), r2=241(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 41
LDI r2, 241
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
