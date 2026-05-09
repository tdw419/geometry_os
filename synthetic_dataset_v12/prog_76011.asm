; DESCRIPTION: Draws a magenta line from (116, 210) to (440, 182).
; PLAN: r0=116(x1), r1=210(y1), r2=440(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 210
LDI r2, 440
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
