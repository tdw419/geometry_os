; DESCRIPTION: Places a cyan dot at position (116, 146).
; PLAN: r0=116(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
