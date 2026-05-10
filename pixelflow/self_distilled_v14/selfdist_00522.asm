; DESCRIPTION: Renders a white line segment connecting (225, 102) to (187, 197).
; PLAN: r0=225(x1), r1=102(y1), r2=187(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 102
LDI r2, 187
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
