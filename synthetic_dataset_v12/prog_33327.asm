; DESCRIPTION: Draws a white line from (334, 130) to (350, 173).
; PLAN: r0=334(x1), r1=130(y1), r2=350(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 130
LDI r2, 350
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
