; DESCRIPTION: Renders a white line segment connecting (386, 196) to (230, 59).
; PLAN: r0=386(x1), r1=196(y1), r2=230(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 196
LDI r2, 230
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
