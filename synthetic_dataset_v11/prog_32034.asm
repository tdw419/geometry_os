; DESCRIPTION: Places a white circle of radius 75 at center (87, 117).
; PLAN: r0=87(x), r1=117(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 117
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
