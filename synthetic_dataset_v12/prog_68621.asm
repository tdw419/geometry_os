; DESCRIPTION: Places a white circle of radius 42 at center (385, 91).
; PLAN: r0=385(x), r1=91(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 91
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
