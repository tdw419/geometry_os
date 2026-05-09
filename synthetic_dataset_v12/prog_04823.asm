; DESCRIPTION: Draws a green line from (405, 174) to (70, 67).
; PLAN: r0=405(x1), r1=174(y1), r2=70(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 174
LDI r2, 70
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
