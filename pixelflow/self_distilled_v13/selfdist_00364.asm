; DESCRIPTION: Renders a white line segment connecting (205, 187) to (153, 27).
; PLAN: r0=205(x1), r1=187(y1), r2=153(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 187
LDI r2, 153
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
