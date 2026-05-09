; DESCRIPTION: Renders a magenta line between points (488, 86) and (101, 229).
; PLAN: r0=488(x1), r1=86(y1), r2=101(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 86
LDI r2, 101
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
