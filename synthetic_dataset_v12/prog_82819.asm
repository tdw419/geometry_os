; DESCRIPTION: Renders a magenta line between points (403, 215) and (35, 141).
; PLAN: r0=403(x1), r1=215(y1), r2=35(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 215
LDI r2, 35
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
