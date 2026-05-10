; DESCRIPTION: Renders a red circular shape at (45, 150) with radius 24.
; PLAN: r0=45(x), r1=150(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 150
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
