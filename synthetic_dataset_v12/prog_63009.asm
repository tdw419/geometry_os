; DESCRIPTION: Places a white dot at position (352, 209).
; PLAN: r0=352(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
