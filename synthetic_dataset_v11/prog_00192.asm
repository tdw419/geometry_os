; DESCRIPTION: Renders a green disk with center (154, 150) and radius 56.
; PLAN: r0=154(x), r1=150(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 150
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
