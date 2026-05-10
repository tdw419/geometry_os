; DESCRIPTION: Renders a white line segment connecting (291, 127) to (280, 107).
; PLAN: r0=291(x1), r1=127(y1), r2=280(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 127
LDI r2, 280
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
