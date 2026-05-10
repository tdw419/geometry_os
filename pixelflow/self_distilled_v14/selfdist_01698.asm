; DESCRIPTION: Places a red disk with center (205, 125) and radius 49.
; PLAN: r0=205(x), r1=125(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 125
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
