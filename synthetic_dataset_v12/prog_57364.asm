; DESCRIPTION: Draws a green line from (502, 123) to (300, 67).
; PLAN: r0=502(x1), r1=123(y1), r2=300(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 123
LDI r2, 300
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
