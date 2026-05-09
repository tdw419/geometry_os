; DESCRIPTION: Renders a magenta line between points (500, 134) and (344, 117).
; PLAN: r0=500(x1), r1=134(y1), r2=344(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 134
LDI r2, 344
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
