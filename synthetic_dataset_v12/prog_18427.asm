; DESCRIPTION: Renders a green disk with center (162, 151) and radius 27.
; PLAN: r0=162(x), r1=151(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 151
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
