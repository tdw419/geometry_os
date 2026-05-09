; DESCRIPTION: Places a green circle of radius 42 at center (207, 137).
; PLAN: r0=207(x), r1=137(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 137
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
