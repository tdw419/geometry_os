; DESCRIPTION: Renders a red disk with center (278, 126) and radius 20.
; PLAN: r0=278(x), r1=126(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 126
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
