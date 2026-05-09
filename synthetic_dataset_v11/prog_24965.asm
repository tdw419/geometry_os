; DESCRIPTION: Places a white dot at position (168, 37).
; PLAN: r0=168(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
