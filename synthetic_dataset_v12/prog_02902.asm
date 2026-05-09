; DESCRIPTION: Draws a blue line from (271, 16) to (8, 164).
; PLAN: r0=271(x1), r1=16(y1), r2=8(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 16
LDI r2, 8
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
