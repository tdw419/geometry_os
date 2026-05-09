; DESCRIPTION: Draws a magenta line from (494, 146) to (271, 92).
; PLAN: r0=494(x1), r1=146(y1), r2=271(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 146
LDI r2, 271
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
