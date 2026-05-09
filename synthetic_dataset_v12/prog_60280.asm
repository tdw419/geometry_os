; DESCRIPTION: Draws a blue line from (237, 47) to (191, 166).
; PLAN: r0=237(x1), r1=47(y1), r2=191(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 47
LDI r2, 191
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
