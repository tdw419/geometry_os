; DESCRIPTION: Renders a magenta line between points (104, 131) and (187, 171).
; PLAN: r0=104(x1), r1=131(y1), r2=187(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 131
LDI r2, 187
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
