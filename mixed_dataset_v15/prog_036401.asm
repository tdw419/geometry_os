; DESCRIPTION: Renders a white line between points (307, 54) and (166, 76).
; PLAN: r0=307(x1), r1=54(y1), r2=166(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 54
LDI r2, 166
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
