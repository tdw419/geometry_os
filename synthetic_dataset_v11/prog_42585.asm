; DESCRIPTION: Draws a blue line from (26, 111) to (32, 231).
; PLAN: r0=26(x1), r1=111(y1), r2=32(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 111
LDI r2, 32
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
