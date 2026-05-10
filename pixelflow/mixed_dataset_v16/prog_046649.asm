; DESCRIPTION: Renders a magenta line between points (61, 116) and (167, 134).
; PLAN: r0=61(x1), r1=116(y1), r2=167(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 116
LDI r2, 167
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
