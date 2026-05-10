; DESCRIPTION: Renders a yellow circular shape at (46, 149) with radius 63.
; PLAN: r0=46(x), r1=149(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 149
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
