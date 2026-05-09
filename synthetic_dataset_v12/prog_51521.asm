; DESCRIPTION: Renders a orange line between points (303, 129) and (167, 237).
; PLAN: r0=303(x1), r1=129(y1), r2=167(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 129
LDI r2, 167
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
