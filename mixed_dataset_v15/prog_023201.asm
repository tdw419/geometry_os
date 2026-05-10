; DESCRIPTION: Draws a green line from (362, 92) to (85, 67).
; PLAN: r0=362(x1), r1=92(y1), r2=85(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 92
LDI r2, 85
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
