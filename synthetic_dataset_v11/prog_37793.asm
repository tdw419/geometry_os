; DESCRIPTION: Draws a blue line from (94, 154) to (120, 173).
; PLAN: r0=94(x1), r1=154(y1), r2=120(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 154
LDI r2, 120
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
