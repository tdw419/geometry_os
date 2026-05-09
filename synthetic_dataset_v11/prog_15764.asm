; DESCRIPTION: Places a white line segment connecting (32, 130) to (3, 33).
; PLAN: r0=32(x1), r1=130(y1), r2=3(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 130
LDI r2, 3
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
