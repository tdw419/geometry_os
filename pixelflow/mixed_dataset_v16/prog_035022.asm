; DESCRIPTION: Places a green dot at position (126, 76).
; PLAN: r0=126(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
