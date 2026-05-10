; DESCRIPTION: Places a orange disk with center (294, 111) and radius 46.
; PLAN: r0=294(x), r1=111(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 111
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
