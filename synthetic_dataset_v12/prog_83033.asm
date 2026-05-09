; DESCRIPTION: Draws a blue line from (30, 48) to (34, 231).
; PLAN: r0=30(x1), r1=48(y1), r2=34(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 48
LDI r2, 34
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
