; DESCRIPTION: Draws a blue line from (429, 16) to (239, 131).
; PLAN: r0=429(x1), r1=16(y1), r2=239(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 16
LDI r2, 239
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
