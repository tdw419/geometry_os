; DESCRIPTION: Draws a blue line from (435, 168) to (127, 221).
; PLAN: r0=435(x1), r1=168(y1), r2=127(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 168
LDI r2, 127
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
