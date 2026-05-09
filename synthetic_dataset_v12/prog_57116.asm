; DESCRIPTION: Places a cyan dot at position (206, 191).
; PLAN: r0=206(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
