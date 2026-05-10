; DESCRIPTION: Renders a white line segment connecting (367, 32) to (37, 166).
; PLAN: r0=367(x1), r1=32(y1), r2=37(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 32
LDI r2, 37
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
