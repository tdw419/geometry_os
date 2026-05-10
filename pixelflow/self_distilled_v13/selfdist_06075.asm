; DESCRIPTION: Places a orange disk with center (180, 27) and radius 34.
; PLAN: r0=180(x), r1=27(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 27
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
