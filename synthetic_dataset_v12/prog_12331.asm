; DESCRIPTION: Renders a magenta line between points (244, 121) and (268, 142).
; PLAN: r0=244(x1), r1=121(y1), r2=268(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 121
LDI r2, 268
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
