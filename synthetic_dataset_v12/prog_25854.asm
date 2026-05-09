; DESCRIPTION: Places a cyan dot at position (213, 59).
; PLAN: r0=213(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 59
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
