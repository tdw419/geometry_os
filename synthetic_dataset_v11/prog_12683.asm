; DESCRIPTION: Draws a white line from (12, 67) to (189, 208).
; PLAN: r0=12(x1), r1=67(y1), r2=189(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 67
LDI r2, 189
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
