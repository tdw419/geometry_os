; DESCRIPTION: Renders a red disk with center (329, 79) and radius 70.
; PLAN: r0=329(x), r1=79(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 79
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
