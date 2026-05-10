; DESCRIPTION: Draws a magenta line from (167, 215) to (217, 20).
; PLAN: r0=167(x1), r1=215(y1), r2=217(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 215
LDI r2, 217
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
