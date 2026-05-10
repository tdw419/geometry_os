; DESCRIPTION: Places a white line segment connecting (406, 113) to (212, 27).
; PLAN: r0=406(x1), r1=113(y1), r2=212(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 113
LDI r2, 212
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
