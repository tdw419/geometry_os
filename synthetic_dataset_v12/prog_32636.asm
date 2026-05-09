; DESCRIPTION: Places a cyan dot at position (261, 239).
; PLAN: r0=261(x), r1=239(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 239
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
