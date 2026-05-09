; DESCRIPTION: Draws a magenta line from (488, 92) to (193, 73).
; PLAN: r0=488(x1), r1=92(y1), r2=193(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 92
LDI r2, 193
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
