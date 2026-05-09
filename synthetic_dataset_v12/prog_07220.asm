; DESCRIPTION: Renders a yellow disk with center (401, 161) and radius 72.
; PLAN: r0=401(x), r1=161(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 161
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
