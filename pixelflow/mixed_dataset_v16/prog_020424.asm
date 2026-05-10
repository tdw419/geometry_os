; DESCRIPTION: Places a blue circle of radius 39 at center (428, 169).
; PLAN: r0=428(x), r1=169(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 169
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
