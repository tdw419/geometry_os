; DESCRIPTION: Draws a blue line from (256, 164) to (63, 64).
; PLAN: r0=256(x1), r1=164(y1), r2=63(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 164
LDI r2, 63
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
