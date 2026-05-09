; DESCRIPTION: Draws a white line from (24, 148) to (210, 208).
; PLAN: r0=24(x1), r1=148(y1), r2=210(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 148
LDI r2, 210
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
