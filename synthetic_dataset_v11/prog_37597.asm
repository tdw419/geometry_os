; DESCRIPTION: Draws a magenta line from (33, 173) to (69, 118).
; PLAN: r0=33(x1), r1=173(y1), r2=69(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 173
LDI r2, 69
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
