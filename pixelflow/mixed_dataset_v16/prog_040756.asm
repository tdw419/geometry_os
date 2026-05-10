; DESCRIPTION: Places a white dot at position (510, 127).
; PLAN: r0=510(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
