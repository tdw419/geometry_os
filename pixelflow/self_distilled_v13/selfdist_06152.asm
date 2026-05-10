; DESCRIPTION: Places a orange disk with center (17, 129) and radius 20.
; PLAN: r0=17(x), r1=129(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 129
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
