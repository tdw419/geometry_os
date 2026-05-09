; DESCRIPTION: Places a white dot at position (127, 55).
; PLAN: r0=127(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
