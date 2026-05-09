; DESCRIPTION: Draws a blue line from (59, 210) to (368, 144).
; PLAN: r0=59(x1), r1=210(y1), r2=368(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 210
LDI r2, 368
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
