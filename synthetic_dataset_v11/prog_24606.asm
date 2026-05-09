; DESCRIPTION: Draws a blue line from (83, 212) to (45, 42).
; PLAN: r0=83(x1), r1=212(y1), r2=45(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 212
LDI r2, 45
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
