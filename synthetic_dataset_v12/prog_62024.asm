; DESCRIPTION: Places a white dot at position (374, 197).
; PLAN: r0=374(x), r1=197(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 197
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
