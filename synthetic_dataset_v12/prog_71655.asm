; DESCRIPTION: Draws a blue line from (354, 108) to (464, 197).
; PLAN: r0=354(x1), r1=108(y1), r2=464(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 108
LDI r2, 464
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
