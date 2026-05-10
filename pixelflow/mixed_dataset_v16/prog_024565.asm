; DESCRIPTION: Draws a magenta line from (308, 226) to (20, 237).
; PLAN: r0=308(x1), r1=226(y1), r2=20(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 226
LDI r2, 20
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
