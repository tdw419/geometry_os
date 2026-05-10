; DESCRIPTION: Draws a blue line from (198, 194) to (309, 57).
; PLAN: r0=198(x1), r1=194(y1), r2=309(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 194
LDI r2, 309
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
