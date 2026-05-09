; DESCRIPTION: Places a blue circle of radius 36 at center (106, 186).
; PLAN: r0=106(x), r1=186(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 186
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
