; DESCRIPTION: Places a white dot at position (499, 221).
; PLAN: r0=499(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
