; DESCRIPTION: Places a orange disk with center (192, 127) and radius 16.
; PLAN: r0=192(x), r1=127(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 127
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
