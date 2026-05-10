; DESCRIPTION: Draws a blue line from (144, 141) to (237, 171).
; PLAN: r0=144(x1), r1=141(y1), r2=237(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 141
LDI r2, 237
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
