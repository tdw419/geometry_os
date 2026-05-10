; DESCRIPTION: Renders a purple circular shape at (127, 127) with radius 28.
; PLAN: r0=127(x), r1=127(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 127
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
