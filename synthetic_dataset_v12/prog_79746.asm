; DESCRIPTION: Draws a blue line from (69, 200) to (173, 143).
; PLAN: r0=69(x1), r1=200(y1), r2=173(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 200
LDI r2, 173
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
