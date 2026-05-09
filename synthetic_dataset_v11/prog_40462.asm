; DESCRIPTION: Draws a blue line from (180, 132) to (242, 62).
; PLAN: r0=180(x1), r1=132(y1), r2=242(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 132
LDI r2, 242
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
