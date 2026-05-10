; DESCRIPTION: Renders a white line segment connecting (258, 129) to (380, 26).
; PLAN: r0=258(x1), r1=129(y1), r2=380(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 129
LDI r2, 380
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
