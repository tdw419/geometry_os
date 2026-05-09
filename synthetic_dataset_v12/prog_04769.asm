; DESCRIPTION: Draws a blue line from (49, 207) to (450, 242).
; PLAN: r0=49(x1), r1=207(y1), r2=450(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 207
LDI r2, 450
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
