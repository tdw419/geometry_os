; DESCRIPTION: Places a blue circle of radius 42 at center (185, 161).
; PLAN: r0=185(x), r1=161(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 161
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
