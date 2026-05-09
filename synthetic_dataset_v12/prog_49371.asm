; DESCRIPTION: Draws a blue line from (424, 79) to (330, 215).
; PLAN: r0=424(x1), r1=79(y1), r2=330(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 79
LDI r2, 330
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
