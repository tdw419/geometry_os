; DESCRIPTION: Renders a orange disk with center (386, 205) and radius 37.
; PLAN: r0=386(x), r1=205(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 205
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
