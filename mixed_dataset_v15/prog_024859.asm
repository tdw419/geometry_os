; DESCRIPTION: Renders a red circular shape at (160, 197) with radius 23.
; PLAN: r0=160(x), r1=197(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 197
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
