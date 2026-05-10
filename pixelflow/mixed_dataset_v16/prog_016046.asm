; DESCRIPTION: Places a white dot at position (415, 97).
; PLAN: r0=415(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 415
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
