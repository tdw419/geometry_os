; DESCRIPTION: Places a blue dot at position (46, 240).
; PLAN: r0=46(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
