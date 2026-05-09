; DESCRIPTION: Draws a magenta line from (113, 27) to (92, 187).
; PLAN: r0=113(x1), r1=27(y1), r2=92(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 27
LDI r2, 92
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
