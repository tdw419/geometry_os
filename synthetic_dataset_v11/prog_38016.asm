; DESCRIPTION: Places a white circle of radius 52 at center (103, 150).
; PLAN: r0=103(x), r1=150(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 150
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
