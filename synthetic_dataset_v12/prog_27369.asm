; DESCRIPTION: Draws a yellow line from (480, 67) to (134, 165).
; PLAN: r0=480(x1), r1=67(y1), r2=134(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 67
LDI r2, 134
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
