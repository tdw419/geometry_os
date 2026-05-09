; DESCRIPTION: Places a white dot at position (370, 240).
; PLAN: r0=370(x), r1=240(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 240
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
