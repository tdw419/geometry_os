; DESCRIPTION: Renders a magenta line between points (180, 228) and (81, 219).
; PLAN: r0=180(x1), r1=228(y1), r2=81(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 228
LDI r2, 81
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
