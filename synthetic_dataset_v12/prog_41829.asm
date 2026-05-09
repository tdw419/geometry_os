; DESCRIPTION: Renders a magenta line between points (187, 76) and (72, 132).
; PLAN: r0=187(x1), r1=76(y1), r2=72(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 76
LDI r2, 72
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
