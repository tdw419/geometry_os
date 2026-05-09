; DESCRIPTION: Places a cyan dot at position (214, 3).
; PLAN: r0=214(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
