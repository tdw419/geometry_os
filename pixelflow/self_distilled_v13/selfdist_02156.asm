; DESCRIPTION: Renders a blue circular shape at (387, 190) with radius 45.
; PLAN: r0=387(x), r1=190(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 190
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
