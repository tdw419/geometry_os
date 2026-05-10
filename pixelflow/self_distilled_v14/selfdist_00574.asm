; DESCRIPTION: Places a white disk with center (152, 75) and radius 50.
; PLAN: r0=152(x), r1=75(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 75
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
