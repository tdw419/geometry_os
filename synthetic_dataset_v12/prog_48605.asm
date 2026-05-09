; DESCRIPTION: Renders a green disk with center (154, 196) and radius 50.
; PLAN: r0=154(x), r1=196(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 196
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
