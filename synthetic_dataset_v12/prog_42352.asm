; DESCRIPTION: Draws a blue line from (122, 107) to (480, 141).
; PLAN: r0=122(x1), r1=107(y1), r2=480(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 107
LDI r2, 480
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
