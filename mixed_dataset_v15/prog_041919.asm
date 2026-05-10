; DESCRIPTION: Draws a white line from (53, 130) to (507, 84).
; PLAN: r0=53(x1), r1=130(y1), r2=507(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 130
LDI r2, 507
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
