; DESCRIPTION: Places a green dot at position (32, 138).
; PLAN: r0=32(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
