; DESCRIPTION: Places a cyan dot at position (420, 163).
; PLAN: r0=420(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
