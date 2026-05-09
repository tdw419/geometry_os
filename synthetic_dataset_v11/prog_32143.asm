; DESCRIPTION: Places a blue circle of radius 29 at center (116, 169).
; PLAN: r0=116(x), r1=169(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 169
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
