; DESCRIPTION: Draws a blue line from (96, 143) to (299, 83).
; PLAN: r0=96(x1), r1=143(y1), r2=299(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 143
LDI r2, 299
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
