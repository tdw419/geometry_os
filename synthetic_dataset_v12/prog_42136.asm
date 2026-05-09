; DESCRIPTION: Places a white circle of radius 10 at center (46, 221).
; PLAN: r0=46(x), r1=221(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 221
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
