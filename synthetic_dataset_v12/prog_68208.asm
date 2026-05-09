; DESCRIPTION: Places a cyan circle of radius 31 at center (346, 103).
; PLAN: r0=346(x), r1=103(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 103
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
