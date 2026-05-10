; DESCRIPTION: Places a orange disk with center (63, 25) and radius 27.
; PLAN: r0=63(x), r1=25(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 25
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
