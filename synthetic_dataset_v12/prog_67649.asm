; DESCRIPTION: Places a white line segment connecting (4, 130) to (39, 164).
; PLAN: r0=4(x1), r1=130(y1), r2=39(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 130
LDI r2, 39
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
