; DESCRIPTION: Renders a magenta line between points (283, 113) and (125, 231).
; PLAN: r0=283(x1), r1=113(y1), r2=125(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 113
LDI r2, 125
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
