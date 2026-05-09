; DESCRIPTION: Places a orange circle of radius 48 at center (263, 158).
; PLAN: r0=263(x), r1=158(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 158
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
