; DESCRIPTION: Places a green line segment connecting (59, 111) to (154, 52).
; PLAN: r0=59(x1), r1=111(y1), r2=154(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 111
LDI r2, 154
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
