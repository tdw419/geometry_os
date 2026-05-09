; DESCRIPTION: Renders a magenta line between points (49, 202) and (365, 60).
; PLAN: r0=49(x1), r1=202(y1), r2=365(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 202
LDI r2, 365
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
