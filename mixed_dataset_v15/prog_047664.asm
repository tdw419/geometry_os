; DESCRIPTION: Renders a white line segment connecting (305, 151) to (68, 127).
; PLAN: r0=305(x1), r1=151(y1), r2=68(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 151
LDI r2, 68
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
