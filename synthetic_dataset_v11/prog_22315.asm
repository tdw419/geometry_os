; DESCRIPTION: Places a magenta dot at position (255, 41).
; PLAN: r0=255(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
