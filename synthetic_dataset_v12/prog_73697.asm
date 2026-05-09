; DESCRIPTION: Draws a blue line from (436, 146) to (392, 146).
; PLAN: r0=436(x1), r1=146(y1), r2=392(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 146
LDI r2, 392
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
