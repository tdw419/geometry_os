; DESCRIPTION: Renders a magenta line between points (135, 238) and (348, 242).
; PLAN: r0=135(x1), r1=238(y1), r2=348(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 238
LDI r2, 348
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
