; DESCRIPTION: Renders a magenta line between points (171, 210) and (296, 6).
; PLAN: r0=171(x1), r1=210(y1), r2=296(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 210
LDI r2, 296
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
