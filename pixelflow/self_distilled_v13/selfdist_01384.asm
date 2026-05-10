; DESCRIPTION: Draws a white line from (240, 153) to (117, 67).
; PLAN: r0=240(x1), r1=153(y1), r2=117(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 153
LDI r2, 117
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
