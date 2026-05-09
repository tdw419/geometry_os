; DESCRIPTION: Places a white dot at position (151, 42).
; PLAN: r0=151(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
