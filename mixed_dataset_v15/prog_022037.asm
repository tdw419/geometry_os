; DESCRIPTION: Renders a red disk with center (214, 152) and radius 29.
; PLAN: r0=214(x), r1=152(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 152
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
