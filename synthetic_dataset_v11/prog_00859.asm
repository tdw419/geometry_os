; DESCRIPTION: Places a cyan dot at position (198, 204).
; PLAN: r0=198(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
