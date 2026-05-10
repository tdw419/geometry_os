; DESCRIPTION: Places a orange disk with center (213, 164) and radius 16.
; PLAN: r0=213(x), r1=164(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 164
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
