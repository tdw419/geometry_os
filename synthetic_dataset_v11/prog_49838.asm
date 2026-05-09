; DESCRIPTION: Places a white line segment connecting (59, 111) to (127, 200).
; PLAN: r0=59(x1), r1=111(y1), r2=127(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 111
LDI r2, 127
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
