; DESCRIPTION: Renders a magenta disk with center (162, 208) and radius 27.
; PLAN: r0=162(x), r1=208(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 208
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
