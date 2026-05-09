; DESCRIPTION: Places a blue dot at position (497, 213).
; PLAN: r0=497(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
