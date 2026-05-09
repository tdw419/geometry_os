; DESCRIPTION: Draws a blue line from (173, 199) to (135, 64).
; PLAN: r0=173(x1), r1=199(y1), r2=135(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 199
LDI r2, 135
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
