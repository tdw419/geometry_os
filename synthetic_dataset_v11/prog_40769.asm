; DESCRIPTION: Places a green dot at position (35, 27).
; PLAN: r0=35(x), r1=27(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 27
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
