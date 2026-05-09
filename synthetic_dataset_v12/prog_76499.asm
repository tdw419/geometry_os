; DESCRIPTION: Draws a white line from (33, 113) to (379, 238).
; PLAN: r0=33(x1), r1=113(y1), r2=379(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 113
LDI r2, 379
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
