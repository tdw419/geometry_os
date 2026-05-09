; DESCRIPTION: Renders a red disk with center (43, 152) and radius 39.
; PLAN: r0=43(x), r1=152(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 152
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
