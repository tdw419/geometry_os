; DESCRIPTION: Renders a white line segment connecting (214, 1) to (298, 127).
; PLAN: r0=214(x1), r1=1(y1), r2=298(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 1
LDI r2, 298
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
