; DESCRIPTION: Places a green circle of radius 25 at center (135, 44).
; PLAN: r0=135(x), r1=44(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 44
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
