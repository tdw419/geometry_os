; DESCRIPTION: Draws a white line from (244, 210) to (75, 53).
; PLAN: r0=244(x1), r1=210(y1), r2=75(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 210
LDI r2, 75
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
