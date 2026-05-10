; DESCRIPTION: Renders a black disk with center (392, 126) and radius 56.
; PLAN: r0=392(x), r1=126(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 126
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
