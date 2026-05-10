; DESCRIPTION: Renders a white line segment connecting (307, 94) to (40, 198).
; PLAN: r0=307(x1), r1=94(y1), r2=40(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 94
LDI r2, 40
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
