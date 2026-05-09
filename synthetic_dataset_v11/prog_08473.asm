; DESCRIPTION: Places a white dot at position (240, 224).
; PLAN: r0=240(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
