; DESCRIPTION: Places a green dot at position (237, 254).
; PLAN: r0=237(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 254
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
