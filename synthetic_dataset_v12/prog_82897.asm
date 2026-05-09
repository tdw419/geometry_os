; DESCRIPTION: Renders a white line between points (309, 130) and (139, 166).
; PLAN: r0=309(x1), r1=130(y1), r2=139(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 130
LDI r2, 139
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
