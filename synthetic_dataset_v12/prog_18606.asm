; DESCRIPTION: Renders a magenta line between points (256, 187) and (362, 101).
; PLAN: r0=256(x1), r1=187(y1), r2=362(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 187
LDI r2, 362
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
