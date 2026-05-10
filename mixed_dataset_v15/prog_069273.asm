; DESCRIPTION: Renders a yellow circular shape at (242, 160) with radius 46.
; PLAN: r0=242(x), r1=160(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 160
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
