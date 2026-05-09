; DESCRIPTION: Renders a yellow disk with center (206, 173) and radius 62.
; PLAN: r0=206(x), r1=173(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 173
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
