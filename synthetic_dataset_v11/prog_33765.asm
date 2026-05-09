; DESCRIPTION: Places a white circle of radius 16 at center (29, 150).
; PLAN: r0=29(x), r1=150(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 150
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
