; DESCRIPTION: Renders a magenta line between points (32, 135) and (180, 161).
; PLAN: r0=32(x1), r1=135(y1), r2=180(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 135
LDI r2, 180
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
