; DESCRIPTION: Draws a blue line from (241, 67) to (315, 242).
; PLAN: r0=241(x1), r1=67(y1), r2=315(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 67
LDI r2, 315
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
