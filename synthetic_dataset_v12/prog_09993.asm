; DESCRIPTION: Places a green line segment connecting (313, 205) to (426, 240).
; PLAN: r0=313(x1), r1=205(y1), r2=426(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 205
LDI r2, 426
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
