; DESCRIPTION: Renders a magenta disk with center (178, 152) and radius 27.
; PLAN: r0=178(x), r1=152(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 152
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
