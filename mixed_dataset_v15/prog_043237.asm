; DESCRIPTION: Draws a magenta line from (35, 171) to (48, 164).
; PLAN: r0=35(x1), r1=171(y1), r2=48(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 171
LDI r2, 48
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
