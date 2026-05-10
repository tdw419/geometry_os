; DESCRIPTION: Renders a white line segment connecting (354, 13) to (178, 198).
; PLAN: r0=354(x1), r1=13(y1), r2=178(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 13
LDI r2, 178
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
