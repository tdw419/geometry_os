; DESCRIPTION: Draws a magenta line from (348, 215) to (327, 62).
; PLAN: r0=348(x1), r1=215(y1), r2=327(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 215
LDI r2, 327
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
