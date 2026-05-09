; DESCRIPTION: Places a white line segment connecting (164, 215) to (338, 115).
; PLAN: r0=164(x1), r1=215(y1), r2=338(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 215
LDI r2, 338
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
