; DESCRIPTION: Places a white line segment connecting (28, 196) to (164, 126).
; PLAN: r0=28(x1), r1=196(y1), r2=164(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 196
LDI r2, 164
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
