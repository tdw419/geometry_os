; DESCRIPTION: Places a cyan dot at position (243, 73).
; PLAN: r0=243(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
