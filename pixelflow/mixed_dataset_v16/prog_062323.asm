; DESCRIPTION: Places a cyan dot at position (499, 148).
; PLAN: r0=499(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
