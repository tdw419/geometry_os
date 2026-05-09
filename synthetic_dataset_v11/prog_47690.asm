; DESCRIPTION: Draws a white line from (210, 86) to (58, 208).
; PLAN: r0=210(x1), r1=86(y1), r2=58(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 86
LDI r2, 58
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
