; DESCRIPTION: Renders a white line between points (244, 53) and (72, 249).
; PLAN: r0=244(x1), r1=53(y1), r2=72(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 53
LDI r2, 72
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
