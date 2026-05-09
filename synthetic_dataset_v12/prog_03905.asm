; DESCRIPTION: Places a white line segment connecting (306, 210) to (402, 171).
; PLAN: r0=306(x1), r1=210(y1), r2=402(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 210
LDI r2, 402
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
