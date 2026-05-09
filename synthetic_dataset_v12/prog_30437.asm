; DESCRIPTION: Draws a magenta line from (485, 82) to (51, 71).
; PLAN: r0=485(x1), r1=82(y1), r2=51(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 82
LDI r2, 51
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
