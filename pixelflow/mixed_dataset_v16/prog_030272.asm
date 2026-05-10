; DESCRIPTION: Draws a blue line from (408, 36) to (280, 171).
; PLAN: r0=408(x1), r1=36(y1), r2=280(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 36
LDI r2, 280
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
