; DESCRIPTION: Places a cyan dot at position (302, 171).
; PLAN: r0=302(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
