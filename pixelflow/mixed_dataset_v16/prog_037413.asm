; DESCRIPTION: Places a white circle of radius 42 at center (131, 143).
; PLAN: r0=131(x), r1=143(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 143
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
