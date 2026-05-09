; DESCRIPTION: Creates a cyan circular shape at (346, 131) with radius 27.
; PLAN: r0=346(x), r1=131(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 131
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
