; DESCRIPTION: Places a green circle of radius 16 at center (43, 73).
; PLAN: r0=43(x), r1=73(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 73
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
