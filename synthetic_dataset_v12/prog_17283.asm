; DESCRIPTION: Renders a magenta line between points (154, 96) and (401, 116).
; PLAN: r0=154(x1), r1=96(y1), r2=401(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 96
LDI r2, 401
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
