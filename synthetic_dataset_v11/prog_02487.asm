; DESCRIPTION: Draws a blue line from (213, 117) to (197, 92).
; PLAN: r0=213(x1), r1=117(y1), r2=197(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 117
LDI r2, 197
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
