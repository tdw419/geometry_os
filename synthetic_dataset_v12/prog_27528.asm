; DESCRIPTION: Renders a red disk with center (222, 111) and radius 46.
; PLAN: r0=222(x), r1=111(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 111
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
