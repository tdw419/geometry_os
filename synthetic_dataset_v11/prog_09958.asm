; DESCRIPTION: Draws a blue line from (148, 173) to (174, 138).
; PLAN: r0=148(x1), r1=173(y1), r2=174(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 173
LDI r2, 174
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
