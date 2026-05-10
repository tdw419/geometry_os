; DESCRIPTION: Places a orange disk with center (269, 143) and radius 28.
; PLAN: r0=269(x), r1=143(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 143
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
