; DESCRIPTION: Places a white line segment connecting (346, 164) to (112, 83).
; PLAN: r0=346(x1), r1=164(y1), r2=112(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 164
LDI r2, 112
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
