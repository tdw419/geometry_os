; DESCRIPTION: Renders a magenta line between points (401, 113) and (57, 176).
; PLAN: r0=401(x1), r1=113(y1), r2=57(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 113
LDI r2, 57
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
