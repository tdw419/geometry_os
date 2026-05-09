; DESCRIPTION: Composite: . Then Renders a black disk with center (109, 121) and radius 67. Then Places a yellow dot at position (218, 169).
; PLAN: r0=109(x), r1=121(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=218(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (109, 121) and radius 67.
; PLAN: r0=109(x), r1=121(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 121
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (218, 169).
; PLAN: r0=218(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 169
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
