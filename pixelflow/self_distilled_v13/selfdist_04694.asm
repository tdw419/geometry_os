; DESCRIPTION: Draws a magenta line from (387, 11) to (187, 109).
; PLAN: r0=387(x1), r1=11(y1), r2=187(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 11
LDI r2, 187
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
