; DESCRIPTION: Places a cyan dot at position (359, 209).
; PLAN: r0=359(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
