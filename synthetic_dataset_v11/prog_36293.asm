; DESCRIPTION: Draws a blue line from (10, 45) to (50, 231).
; PLAN: r0=10(x1), r1=45(y1), r2=50(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 45
LDI r2, 50
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
