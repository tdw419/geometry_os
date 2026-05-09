; DESCRIPTION: Places a white line segment connecting (32, 178) to (346, 171).
; PLAN: r0=32(x1), r1=178(y1), r2=346(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 178
LDI r2, 346
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
