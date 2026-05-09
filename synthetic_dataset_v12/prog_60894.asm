; DESCRIPTION: Renders a yellow disk with center (405, 170) and radius 50.
; PLAN: r0=405(x), r1=170(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 170
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
