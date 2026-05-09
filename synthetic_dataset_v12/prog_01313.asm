; DESCRIPTION: Draws a blue line from (327, 150) to (399, 243).
; PLAN: r0=327(x1), r1=150(y1), r2=399(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 150
LDI r2, 399
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
