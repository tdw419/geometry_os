; DESCRIPTION: Draws a white line from (109, 238) to (210, 133).
; PLAN: r0=109(x1), r1=238(y1), r2=210(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 238
LDI r2, 210
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
