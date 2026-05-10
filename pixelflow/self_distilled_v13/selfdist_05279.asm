; DESCRIPTION: Places a orange disk with center (295, 38) and radius 64.
; PLAN: r0=295(x), r1=38(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 38
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
