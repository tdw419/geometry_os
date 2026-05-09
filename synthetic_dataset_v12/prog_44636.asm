; DESCRIPTION: Places a white line segment connecting (275, 130) to (453, 107).
; PLAN: r0=275(x1), r1=130(y1), r2=453(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 130
LDI r2, 453
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
